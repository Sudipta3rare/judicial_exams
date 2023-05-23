import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:judicial_exams/controller/dashboard_controller.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/controller/payment_controller.dart';
import 'package:judicial_exams/controller/start_exam_controller.dart';
import 'package:judicial_exams/controller/submit_exam_controller.dart';
import 'package:judicial_exams/controller/timer_controller.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/models/purchasedList_model.dart';
import 'package:judicial_exams/signup.dart';
import 'package:judicial_exams/views/dashboard_page/dashboard.dart';
import 'package:judicial_exams/views/dashboard_page/pages/examlist.dart';
import 'package:judicial_exams/views/dashboard_page/pages/ongoing_exams.dart';
import 'package:judicial_exams/views/payment/payment_page.dart';
import 'package:judicial_exams/views/slider_pages/Slider1.dart';
import 'package:judicial_exams/views/start_exam_pages/submit_exam_page.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Get.put(DashboardController());
  Get.put<ExamListController>(ExamListController());
  // Get.lazyPut(() => PurchasedExamController());
  Get.put<PaymentController>(PaymentController(),);
  Get.put<StartExamController>(StartExamController(),);
  // Get.lazyPut<TimerController>(() => TimerController(), fenix: true);
  Get.put(TimerController());
  Get.put(SubmitExamController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first',
      routes: {
        'first': (context) => Slider1(),
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'home': (context) => DashboardPage(),
        'examList' : (context) => ExamList(),
        'ongoingExams' : (context) => OngoingExams(),
        'paymentPage' : (context) => PaymentPage(),
        'submitExamPage' : (context) =>SubmitExamPage(),

      },
    ));
  }
}
