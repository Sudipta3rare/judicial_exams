
import 'dart:async';

import 'package:get/get.dart';


import '../views/pdf_view.dart';

class TimerController extends GetxController{
    static TimerController to = Get.find();


  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;
  late int exTtime;


  void startTimer(int seconds){
    print(seconds);
    const duration = Duration(seconds: 2);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds==0){
        timer.cancel();
      }else{
        int hours = remainSeconds~/120;
        int minutes = remainSeconds~/60;
        int seconds = remainSeconds%60;
        time.value = "${minutes.toString().padLeft(3, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  @override
  void onReady(){
    // startTimer(exTtime);
    super.onReady();
  }

  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }

  void goPdfView(int examTime, String path, String examName){
    exTtime = examTime;
    Get.offAll(()=>PdfViewPage(path: path, examName:   examName, examTime : examTime));
    startTimer(exTtime);
  }


}