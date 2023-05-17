import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/purchasedExam_controller.dart';

import '../../utils/styles.dart';

class PurchasedListItem extends StatelessWidget {
   PurchasedListItem({Key? key,
   required this.index,

   });

   int index;



  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasedExamController>(builder: (listCtrl) {
      return Card(
        shape: RoundedRectangleBorder(
          side:  BorderSide(color: AppStyle().button, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Expanded(
                  //   flex: 0,
                  //   child: Transform.scale(
                  //     scale: 1.15,
                  //     child: Checkbox(
                  //       shape: const CircleBorder(),
                  //       activeColor: AppStyle().button,
                  //       checkColor:AppStyle().backgroundColor,
                  //       value: value,
                  //       onChanged: (bool? newValue) {
                  //         listCtrl.examList[index].toggleIsSelected();
                  //         listCtrl.update();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 2,
                    child: ListSubItem( listCtrl.purchaseExamList[index].examName,  listCtrl.purchaseExamList[index].examTitle),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListSubItem(listCtrl.purchaseExamList[index].examDate.toString(),
                      "Exam Date:",

                    ),

                  )
                ],
              ),
              const SizedBox(height: 3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Expanded(
                  //   flex: 0,
                  //   child: IconButton(
                  //     icon: const Icon(Icons.info_outline),
                  //     color: AppStyle().button,
                  //     onPressed: () {
                  //
                  //       // listCtrl.goToOrderDetail();
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    flex: 2,
                    child: ListSubItem(  listCtrl.purchaseExamList[index].examStatus, "Exam Status"),

                  ),
                  Expanded(
                    flex: 1,
                    child:ListSubItem(listCtrl.purchaseExamList[index].examDuration,"Exam Time:",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ListSubItem extends StatelessWidget {
  const ListSubItem(this.heading, this.itemValue, {super.key}) ;
  final String heading;
  final String itemValue;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchasedExamController>(builder: (listCtrl) {
      return SizedBox(
        height:50.0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  heading,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  itemValue,
                  style: GoogleFonts.montserrat(
                      fontSize: 14
                  ),
                  // overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
