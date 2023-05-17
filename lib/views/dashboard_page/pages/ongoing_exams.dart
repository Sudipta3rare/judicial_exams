import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/purchasedExam_controller.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/components/purchased_list_component.dart';

class OngoingExams extends StatelessWidget {
  const OngoingExams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().backgroundColor,

      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text('Purchased Exams', style:
        GoogleFonts.montserrat(
          color: AppStyle().textHeading,
        ),),
      ),

      body: _showBody(context)
    );
  }
  Widget _showBody(BuildContext context){
    return SafeArea(child:GetBuilder<PurchasedExamController>(
        builder: (ctrl) {
          return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: ctrl.purchaseExamList.length,
              itemBuilder: (BuildContext context, int index) => PurchasedListItem(index: index));
        }
    ));
  }
}
