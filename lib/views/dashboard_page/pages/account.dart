import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:get/get.dart';


import '../../../utils/styles.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppStyle().backgroundColor,
      body: SafeArea(
        child: GestureDetector(
            onTap: () async {await FirebaseAuth.instance.signOut();
              Get.offAndToNamed('login');
              },
            child: CustomButton().customButtonSmall(context, 'Sign Out')),
      ),
    );
  }
}
