import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class StartExamController extends GetxController{
  static StartExamController to = Get.find();

  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;


  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
  Future download(Dio dio, String url, String savePath) async {
    try {
      dynamic response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
  void updateProgress(done, total) {
    progress = done / total;
      if (progress >= 1) {
        progressString = '✅ File has finished downloading. \n Try opening the file.';
        didDownloadPDF = true;
      } else {
        progressString = 'Download progress: ' + (progress * 100).toStringAsFixed(0) + '% done.';
      }
      update();
  }
 void startTimer(int seconds){
    const duration = Duration(seconds: 2);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds==0){
        timer.cancel();
      }else{
        int hours = remainSeconds~/120;
        int minutes = remainSeconds~/60;
        int seconds = remainSeconds%60;
        time.value = minutes.toString().padLeft(3, "0")+":"+seconds.toString().padLeft(2, "0");
        remainSeconds--;
      }
    });
  }

  @override
  void onReady(){
    // _startTimer(900);
    super.onReady();
  }

  void onClose(){
    _deleteCacheDir();
    _deleteAppDir();
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }


  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    var appDocDir = await getApplicationDocumentsDirectory();

    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }
}