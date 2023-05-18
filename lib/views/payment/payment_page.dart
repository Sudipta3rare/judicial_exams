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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex:1,
                child: ListView.builder(
                itemCount: ctrl.selectedList.length,
                itemBuilder: (BuildContext context, int index) => showListItem(context, index)
            )
            ),

            Container(
              decoration: BoxDecoration(
                color: AppStyle().button,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              height: 55,

              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Center(
                child: Text("PAY NOW  \u{20B9} ${ctrl.totalAmount()}", style: GoogleFonts.montserrat(
                  color: AppStyle().textHeading,
                  fontSize: 18,

                ),textAlign: TextAlign.center,),
              ),
            )
          ],
        );
      }
    ));
  }

  Widget showListItem(context, int index){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          child: GetBuilder<PaymentController>(
            builder: (ctrl) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${index+1}. ', style:  GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight:  FontWeight.bold,
                      color: AppStyle().secondaryColor
                    ),),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ctrl.selectedList[index].examName, style:
                          GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                        Text(ctrl.selectedList[index].examSubtitle, style:
                          GoogleFonts.montserrat(

                            // fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\u{20B9} ${ctrl.selectedList[index].examPrice}', style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppStyle().secondaryColor
                    ),),
                  ),
                ],
              );
            }
          ),
        ),
        Divider(
          color: AppStyle().primaryColor,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
