import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/dashboard_controller.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/controller/payment_controller.dart';
import 'package:judicial_exams/controller/purchasedExam_controller.dart';
import 'package:judicial_exams/controller/start_exam_controller.dart';
import 'package:judicial_exams/controller/submit_exam_controller.dart';
import 'package:judicial_exams/controller/timer_controller.dart';

import 'package:judicial_exams/views/slider_pages/Slider1.dart';

void main() {

  Get.put(DashboardController());
  Get.put<ExamListController>(ExamListController());
  // Get.lazyPut(() => PurchasedExamController());
  Get.put<PaymentController>(PaymentController(), );
  Get.put<StartExamController>(StartExamController(),);
  // Get.lazyPut<TimerController>(() => TimerController(), fenix: true);
  Get.put(TimerController());
  Get.put(SubmitExamController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      title: 'Judicial Exam',
      debugShowCheckedModeBanner: false,

     home: Slider1(),
    );
  }
}
