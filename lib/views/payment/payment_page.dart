import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/payment_controller.dart';
import 'package:judicial_exams/utils/styles.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text('Make Payment', style:
        GoogleFonts.montserrat(
          color: AppStyle().textHeading,
        ),),
      ),

      body:  _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return SafeArea(child: GetBuilder<PaymentController>(
      builder: (ctrl) {
        return Column(
          children: [
            Expanded(child: ListView.builder(
                itemCount: ctrl.selectedList.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child:
                  Text("${ctrl.selectedList[index].examName}"),)))
          ],
        );
      }
    ));
  }
}
