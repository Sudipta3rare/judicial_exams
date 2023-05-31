
import 'dart:async';

import 'package:get/get.dart';
import 'package:judicial_exams/views/dashboard_page/dashboard.dart';


import '../views/start_exam_pages/pdf_view.dart';
import '../views/start_exam_pages/submit_exam_page.dart';

class TimerController extends GetxController{
    static TimerController to = Get.find();


  Timer? _timer;
  int remainSeconds = 1;
  final RxString  time = '00.00'.obs;
  late double exTtime;
    static const duration = Duration(seconds: 1);

   // Function()? onFinish;

  void startTimer(int seconds, Function onFinish){

    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds<=0){
        timer.cancel();
          time.value = '00.00';
          remainSeconds =1;
          onFinish.call();

      }else{
        int hours = (remainSeconds ~/ 3600) % 60;
        int minutes = (remainSeconds ~/ 60) % 60;
        int seconds = remainSeconds%60;
        time.value = "${hours.toString().padLeft(2,"0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        print(time.value);
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
      remainSeconds =1;

    }
    super.onClose();
  }

  void goPdfView(double examTime, String path, String examName){
    exTtime = examTime;
    Get.offAll(()=>PdfViewPage(path: path, examName:   examName, examTime : examTime.toInt()));

    remainSeconds=1;
    time.value= '00:00';
    startTimer(exTtime.toInt(), (){Get.offAll(SubmitExamPage());});
  }


}