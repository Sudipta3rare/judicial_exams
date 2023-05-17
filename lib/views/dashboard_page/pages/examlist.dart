import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/views/components/examList_tile.dart';
import 'package:judicial_exams/views/payment/payment_page.dart';

import '../../../utils/styles.dart';
class ExamList extends StatelessWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: GetBuilder<ExamListController>(
        builder: (ctrl) {
          return FloatingActionButton.extended(
            backgroundColor: AppStyle().button,
            onPressed: (){
              ctrl.onPurchaseClicked();
              Get.snackbar("Purchase Order: ", ctrl.selectedExamList.isNotEmpty ? "${ctrl.selectedExamList.length} items Selected" : "Please select items for purchase",
                colorText: Colors.white,
                  titleText: Text("Purchase Order:", style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),),
                  messageText: Text(ctrl.selectedExamList.isNotEmpty ? "${ctrl.selectedExamList.length} items Selected" : "Please select items for purchase", style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppStyle().button,
                overlayColor: AppStyle().button,
                  barBlur: 10
              );
              if(ctrl.selectedExamList.isNotEmpty)
              Get.to(()=>PaymentPage());

            }, label: Text("Purchase", style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold
          ),),
          );
        }
      ),
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text('Mock Exams', style:
          GoogleFonts.montserrat(
            color: AppStyle().textHeading,
          ),),
      ),
      backgroundColor:AppStyle().backgroundColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return  SafeArea(
      child: GetBuilder<ExamListController>(
          builder: (ctrl) {
            return ListView.builder(

                padding: EdgeInsets.all(8),
                itemCount:  ctrl.examList.length,
                itemBuilder: (BuildContext context, int index) =>
                    ListItems(
                      // exam: ctrl.examList[index],
                      value: ctrl.examList[index].examSelected,
                      index: index,
                    ));
          }
      ),
    );
  }
}