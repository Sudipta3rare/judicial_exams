import 'package:get/get.dart';
import 'package:judicial_exams/models/purchasedList_model.dart';
class PurchasedExamController extends GetxController{
  List purchaseExamList  = <PurchasedExamList>[
    PurchasedExamList(
      examName: "Exam Name",
      examStatus: 'Pending',
      examDuration: '3hrs',
      examDate: "30/10/2023",
      examTitle: 'An exam title for the exams'
    ),
    PurchasedExamList(
      examName: "Exam Name",
      examStatus: 'Pending',
      examDuration: '3hrs',
      examDate: "30/10/2023",
      examTitle: 'An exam title for the exams'
    ),

  ];
}