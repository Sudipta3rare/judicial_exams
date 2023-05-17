import 'package:get/get.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/models/examList_model.dart';

class PaymentController extends GetxController{
  static PaymentController to = Get.find();

  ExamListController exCtrl = ExamListController.to;
late  List<ExamList>  selectedList = exCtrl.selectedExamList;

    void onInit(){

      print(selectedList.length);
    }


    String totalAmount(){
      double totalAmount = 0.0;
      for( var items in selectedList){
        totalAmount = totalAmount + double.parse(items.examPrice);
      }
      return totalAmount.toString();
    }

}