
import 'dart:async';

import 'package:get/get.dart';
import 'package:judicial_exams/views/dashboard_page/dashboard.dart';


import '../views/start_exam_pages/pdf_view.dart';

class TimerController extends GetxController{
    static TimerController to = Get.find();


  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;
  late double exTtime;

   Function()? onFinish;

  void startTimer(int seconds){
    print(seconds);
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds<=0){
        timer.cancel();
          onFinish?.call();
      }else{
        int hours = (remainSeconds ~/ 3600) % 60;
        int minutes = (remainSeconds ~/ 60) % 60;
        int seconds = remainSeconds%60;
        time.value = "${hours.toString().padLeft(2,"0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
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

  void goPdfView(double examTime, String path, String examName){
    exTtime = examTime;
    Get.offAll(()=>PdfViewPage(path: path, examName:   examName, examTime : examTime.toInt()));
    startTimer(exTtime.toInt());
  }


}