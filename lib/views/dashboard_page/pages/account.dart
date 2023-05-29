import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/account_controller.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/login.dart';
import 'package:judicial_exams/views/exam_log_account/exam_log_page.dart';
import '../../../utils/styles.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
  AccountPageController acCtrl = Get.put(AccountPageController());

  void logout() {
    // Perform logout functionality here
    acCtrl.signOut();
    // Navigate to the login page or any other desired page
    Get.offAll(MyLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Account',
                titleStyle: AppStyle().subheadingBlack,
                content: Text(
                  'Do you want to exit?',
                  style: AppStyle().subheadingNormal,
                ),
                textCancel: 'Cancel',
                textConfirm: 'OK',
                buttonColor: AppStyle().button,
                cancelTextColor: AppStyle().primaryColor,
                confirmTextColor: AppStyle().primaryColor,
                onCancel: () {},
                onConfirm: () {
                  logout();
                },
              );
            },
            icon: Icon(
              Icons.logout_outlined,
              color: AppStyle().textHeading,
            ),
          )
        ],
        backgroundColor: AppStyle().secondaryColor,
        title: Text(
          'Account',
          style: GoogleFonts.montserrat(
            color: AppStyle().textHeading,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              color: AppStyle().secondaryColor,
              child: Card(
                elevation: 10,
                semanticContainer: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${acCtrl.accountDetail.name}',
                      style: AppStyle().sliderHeading,
                    ),
                    Text(
                      "Phone Number : ${acCtrl.accountDetail.phone}",
                      style: AppStyle().subheadingNormal,
                    ),
                    Text(
                      "Email : ${acCtrl.accountDetail.email}",
                      style: AppStyle().subheadingNormal,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: ListTile(
                onTap: () {
                  Get.to(ExamLogPage());
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 2, color: AppStyle().secondaryColor),
                    borderRadius: BorderRadius.circular(10)),
                leading: Icon(
                  Icons.library_add_check_outlined,
                  color: AppStyle().button,
                ),
                title: Text(
                  "My Exam Log",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: AppStyle().button,
                  ),
                ),
                subtitle: Text(
                  "Exam evaluation and completed exams",
                  style: GoogleFonts.montserrat(color: AppStyle().button),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
