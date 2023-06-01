

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/timer_controller.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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

  Future<void> onSubmitFile() async {
    // firebase_storage.UploadTask? task = await uploadFile(selectedPdf.value!);
      Get.offAll(() =>DashboardPage());
  }

  // Future<firebase_storage.UploadTask?> uploadFile(File file) async {
  //   if (file == null) {
  //     print("unable  to upload");
  //     return null;
  //   }
  //
  //   firebase_storage.UploadTask uploadTask;
  //
  //   // Create a Reference to the file
  //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('submitted files')
  //       .child('/${file.path}');
  //
  //   final metadata = firebase_storage.SettableMetadata(
  //       contentType: 'file/pdf',
  //       customMetadata: {'picked-file-path': file.path});
  //   print("Uploading..!");
  //
  //   uploadTask = ref.putData(await file.readAsBytes(), metadata);
  //
  //   print("done..!");
  //   return Future.value(uploadTask);
  // }
}
