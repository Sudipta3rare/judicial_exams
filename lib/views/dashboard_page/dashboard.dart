import 'package:flutter/material.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/dashboard_page/pages/account.dart';
import 'package:judicial_exams/views/dashboard_page/pages/examlist.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controller/dashboard_controller.dart';
import '../components/BottomNavbarItems.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late BuildContext testContext;


  List<Widget> _buildScreens() {
    return [

      Account(),
      ExamList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
            GetBuilder<DashboardController>(
                builder: (dashboardController) {
                  return Scaffold(
                    body: PersistentTabView(
                      context,
                      controller: dashboardController.pTabController,
                      screens: _buildScreens(),
                      items: BottomNavbarItems().navBarsItems(),
                      confineInSafeArea: true,
                      backgroundColor: AppStyle().button,

                      handleAndroidBackButtonPress: true,
                      resizeToAvoidBottomInset: true,
                      stateManagement: true,
                      navBarHeight: MediaQuery
                          .of(context)
                          .viewInsets
                          .bottom > 0
                          ? 0.0
                          : kBottomNavigationBarHeight,
                      margin: const EdgeInsets.all(0.0),
                      popActionScreens: PopActionScreensType.all,
                      bottomScreenMargin: kBottomNavigationBarHeight,
                      selectedTabScreenContext: (context) {
                        testContext = context!;
                      },
                      decoration: NavBarDecoration(
                        border: Border.all(
                          color: AppStyle().button,
                        ),
                      ),
                      popAllScreensOnTapOfSelectedTab: true,
                      itemAnimationProperties: const ItemAnimationProperties(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease,
                      ),
                      screenTransitionAnimation: const ScreenTransitionAnimation(
                        animateTabTransition: false,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 200),
                      ),
                      navBarStyle:
                      NavBarStyle
                          .style8, // Choose the nav bar style with this property
                    ),
                  );
                }
            ),

    );
  }

  // void _showThemeDialog(BuildContext context) {
  //   showDialog<Widget>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return GetBuilder<ThemeController>(
  //           builder: (ctx) {
  //             return RichDialogBox(
  //               title: 'dashboard.mode'.tr,
  //               titleStyle: Styles().h4TextStyle(),
  //               titlePadding: const EdgeInsets.symmetric(vertical: 40),
  //               content: const ToggleThemeModal(),
  //               contentPadding: const EdgeInsets.only(bottom: 50),
  //               backgroundColor: ctx.isDarkModeOn
  //                   ? AppColors.secondaryColor
  //                   : AppColors.scaffoldColor,
  //             );
  //           }
  //       );
  //     },
  //   );
  // }
}
