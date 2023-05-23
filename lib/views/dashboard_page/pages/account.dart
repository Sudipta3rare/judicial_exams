import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/account_controller.dart';
import 'package:judicial_exams/controller/dashboard_controller.dart';
import 'package:judicial_exams/login.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/views/exam_log_account/exam_log_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


import '../../../utils/styles.dart';
class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);



  AccountPageController acCtrl = Get.put(AccountPageController());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor:AppStyle().backgroundColor,

      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            acCtrl.signOut();
          }, icon: Icon(Icons.logout_outlined,
          color: AppStyle().textHeading,))
        ],
        backgroundColor: AppStyle().secondaryColor,
        title: Text('Account', style: GoogleFonts.montserrat(
          color: AppStyle().textHeading,
        ),),
      ),
      body: SafeArea(
       child: ListView(
         children: [
           Card(
             child: Column(
              children: [
                Text('${acCtrl.accountDetail.name}'),
                Text("Phone Number:")
              ],

             ),
           ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ListTile(
              onTap: (){
                    Get.to(ExamLogPage());
              },
              // splashColor: AppStyle().secondaryColor,
              // tileColor: AppStyle().primaryColor,

                 contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(

              side: BorderSide(width: 2,
              color: AppStyle().secondaryColor),
              borderRadius: BorderRadius.circular(10)),
                 leading: Icon(Icons.library_add_check_outlined, color: AppStyle().button,),
              title: Text("My Exam Log", style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: AppStyle().button,
              ),),
              subtitle:  Text("Exam evaluation and completed exams", style: GoogleFonts.montserrat(
                color: AppStyle().button
              ),),
               ),
          ),

         ],
       ),
      ),
    );
  }
}
