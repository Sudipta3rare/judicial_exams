import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/dashboard_controller.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/controller/payment_controller.dart';
import 'package:judicial_exams/controller/purchasedExam_controller.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/slider_pages/Slider1.dart';

void main() {

  Get.put(DashboardController());
  Get.lazyPut<ExamListController>(()=>ExamListController());
  Get.lazyPut(() => PurchasedExamController());
  Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

     home: Slider1(),
    );
  }
}
