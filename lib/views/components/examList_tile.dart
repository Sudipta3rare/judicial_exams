import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/examList_controller.dart';
import 'package:judicial_exams/utils/styles.dart';

import '../../models/examList_model.dart';
class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    // required this.exam,
    required this.value,
    required this.index,
    // required this.examDate,
    // required this.deliveryReq,
    // required this.onChanged
  }) : super(key: key);
  // final ExamList exam;
  final bool value;
  final int index;
  // final String examDate;
  // final String deliveryReq;
  // final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamListController>(builder: (listCtrl) {
      return Card(
        shape: RoundedRectangleBorder(
          side:  BorderSide(color: AppStyle().button, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: Transform.scale(
                      scale: 1.15,
                      child: Checkbox(
                        shape: const CircleBorder(),
                        activeColor: AppStyle().button,
                        checkColor:AppStyle().backgroundColor,
                        value: value,
                        onChanged: (bool? newValue) {
                         listCtrl.examList[index].toggleIsSelected();
                         listCtrl.update();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListSubItem( listCtrl.examList[index].examName,  listCtrl.examList[index].examSubtitle),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListSubItem(listCtrl.examList[index].examDate.toString(),
                      "Exam Date:",

                    ),

                  )
                ],
              ),
              const SizedBox(height: 5.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      icon: const Icon(Icons.info_outline),
                      color: AppStyle().button,
                      onPressed: () {

                        // listCtrl.goToOrderDetail();
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListSubItem("\u{20B9} ${listCtrl.examList[index].examPrice}",  listCtrl.examList[index].examStatus),

                  ),
                  Expanded(
                    flex: 1,
                    child:ListSubItem(listCtrl.examList[index].examDuration,"Exam Time:",
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
    return GetBuilder<ExamListController>(builder: (listCtrl) {
      return SizedBox(
        height:65.0,
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
      );
    });
  }
}