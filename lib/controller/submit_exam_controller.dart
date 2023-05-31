import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/timer_controller.dart';
import 'dart:io';

import '../views/dashboard_page/dashboard.dart';
import '../views/start_exam_pages/submit_exam_page.dart';
class SubmitExamController extends GetxController{
  static SubmitExamController to = Get.find();



  TimerController tmCtrl = TimerController.to;

  final Rx<File?> selectedPdf = Rx<File?>(null);


  void onInit(){
    startSubmitTimer();
  }


  void selectAndDisplayPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedPdf.value = File(result.files.single.path!);
      update();
    }
  }

  void startSubmitTimer(){
    tmCtrl.startTimer(15, (){
      onSubmitFile();
    });
    // tmCtrl.startTimer(15*60);
  }


void onClose(){
    print("On close active");
    tmCtrl.onClose();
}

  void onSubmitFile(){
      Get.offAll(() =>DashboardPage());
  }
}