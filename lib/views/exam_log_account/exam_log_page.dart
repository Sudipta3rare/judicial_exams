import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/exam_log_controller.dart';
import 'package:judicial_exams/utils/styles.dart';

class ExamLogPage extends StatelessWidget {
   ExamLogPage({Key? key}) : super(key: key);

  ExamLogController exCtrl = Get.put(ExamLogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text("Exam Log", style:  GoogleFonts.montserrat(
          color: AppStyle().textHeading,
        )),
      ),
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return ListView.separated(
      padding: EdgeInsets.all(10),
        cacheExtent: 0,
        itemCount: exCtrl.examLogList.length,
        itemBuilder: (context, int index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: AppStyle().secondaryColor,
            child: Text(
              '${index+1}',
              style:GoogleFonts.montserrat(
                color: AppStyle().textHeading
              ),
            ),
          ),
          // tileColor: AppStyle().textHeading,
          contentPadding: EdgeInsets.all(5),
      title: Text("Exam Name : ${exCtrl.examLogList[index].examName}", style: AppStyle().defaultText,),
      trailing:  Text(exCtrl.examLogList[index].examMarks, style: AppStyle().subheadingBlack),
      subtitle: Text("Exam Attended On : ${exCtrl.examLogList[index].examAttendedDate}" ,style: AppStyle().defaultText),
    ), separatorBuilder: (BuildContext context, int index) {   return Divider(
        thickness: 2); },);
  }
}
