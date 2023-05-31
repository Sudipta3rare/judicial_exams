import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/models/account_model.dart';
import 'dashboard_controller.dart';

class AccountPageController extends GetxController {
  static AccountPageController to = Get.find();

  DashboardController dsCtrl = DashboardController.to;
  final FirebaseAuth auth = FirebaseAuth.instance;

  AccountDetails accountDetail = AccountDetails(
      name: "User Name", email: "user.name@example.com", phone: "1234567890");

  signOut() async {
    dsCtrl.pTabController.index = 0;
    await auth.signOut().then((value) => Get.offAndToNamed('login'));
  }
}
