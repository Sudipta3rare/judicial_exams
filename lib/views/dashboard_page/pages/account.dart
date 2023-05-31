import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/account_controller.dart';
import 'package:judicial_exams/login.dart';
import 'package:judicial_exams/views/exam_log_account/exam_log_page.dart';
import '../../../utils/styles.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
  final AccountPageController acCtrl = Get.put(AccountPageController());

  void logout() {
    acCtrl.signOut();
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
                middleTextStyle: AppStyle().subheadingBlack,
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
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error occurred'));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('No data available'));
            }

            final data = snapshot.data!.data();
            final fullname = data?['fullname'] as String? ?? '';
            final phone = data?['phone'] as String? ?? '';
            final email = data?['email'] as String? ?? '';

            return ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: AppStyle().secondaryColor,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Full Name: $fullname',
                          style: AppStyle().sliderHeading,
                        ),
                        Text(
                          'Phone Number: $phone',
                          style: AppStyle().subheadingNormal,
                        ),
                        Text(
                          'Email: $email',
                          style: AppStyle().subheadingNormal,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: ListTile(
                    onTap: () {
                      Get.to(ExamLogPage());
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: AppStyle().secondaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Icon(
                      Icons.library_add_check_outlined,
                      color: AppStyle().button,
                    ),
                    title: Text(
                      'My Exam Log',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppStyle().button,
                      ),
                    ),
                    subtitle: Text(
                      'Exam evaluation and completed exams',
                      style: GoogleFonts.montserrat(color: AppStyle().button),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
