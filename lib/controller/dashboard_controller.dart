import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardController extends GetxController {
  static DashboardController to = Get.find();
  final GlobalKey<ScaffoldState> dashScaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentTabController pTabController;
  Rx<int> clickIndex = 0.obs;
  // Rx<int> tagSelectIndex = 0.obs;
  // Rx<bool> isNumber = true.obs;

  @override
  void onInit() {
    pTabController = PersistentTabController(initialIndex: 0);
    changeTabIndex();
    super.onInit();
  }

  @override
  void dispose() {
    dashScaffoldKey.currentState?.dispose();
    super.dispose();
  }

  final List<Map<String,dynamic>> menuList = <Map<String,dynamic>>
  [
    {
      'icon': 'home',
      'title': 'dashboard.home',
      'number': '',
    },
  ];

  void changeTabIndex(){
    // clickIndex.value = index;
    pTabController.addListener(() {
      switch(pTabController.index){
        case 0 : clickIndex.value = 0;
        break;
        case 1: clickIndex.value = 2;
        break;
      }
    });
  }


// void toggleDrawer(){
//   if (dashScaffoldKey.currentState!.isDrawerOpen) {
//     dashScaffoldKey.currentState!.openEndDrawer();
//   } else {
//     dashScaffoldKey.currentState!.openDrawer();
//   }
// }

// void gotoHome(){
//   pTabController.jumpToTab(0);
// toggleDrawer();
// }

}