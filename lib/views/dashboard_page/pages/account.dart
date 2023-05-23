import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judicial_exams/controller/dashboard_controller.dart';
import 'package:judicial_exams/login.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


import '../../../utils/styles.dart';
class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
DashboardController dsCtrl = DashboardController.to;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    //signout function
    signOut() async {
     // dsCtrl.clickIndex.value =0;
     dsCtrl.pTabController.index = 0;
      await auth.signOut().then((value) => Get.offAndToNamed('login'));
    }

      return Scaffold(
      backgroundColor:AppStyle().backgroundColor,
      body: SafeArea(
        child: GestureDetector(
            onTap: ()  {
              signOut();
            },
            child: CustomButton().customButtonSmall(context, 'Sign Out')),
      ),
    );
  }
}
