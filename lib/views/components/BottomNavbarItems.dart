import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavbarItems{
  List<PersistentBottomNavBarItem> navBarsItems() {
    return [

      PersistentBottomNavBarItem(
          title: 'Exam List'.tr,
          icon: Icon(Icons.featured_play_list_sharp,
            color: Colors.white,),
          inactiveIcon: Icon(Icons.featured_play_list_sharp,
            color:AppStyle().primaryColor,
            size: 22.0,),
          //     icon: SvgPicture.asset('assets/icons/home_icon.svg',
          // color: thCtrl.isDarkModeOn
          //     ? AppColors.iconActiveColor
          //     : AppColors.buttonColor),
          // inactiveIcon: SvgPicture.asset('assets/icons/home_icon.svg',
          //     color: thCtrl.isDarkModeOn
          //         ? AppColors.iconInactiveColor
          //         : AppColors.buttonColor),
        activeColorPrimary: AppStyle().textHeading,
          inactiveColorPrimary: AppStyle().primaryColor,
         ),

      PersistentBottomNavBarItem(
          title: 'Profile'.tr,
          textStyle: GoogleFonts.montserrat(
            color: AppStyle().primaryColor,
            fontSize: 12
          ),
          icon: Icon(Icons.person,
            color: Colors.white),
          inactiveIcon: Icon(Icons.person,
            color: AppStyle().primaryColor,
            size: 22.0,),
          //     icon: SvgPicture.asset('assets/icons/home_icon.svg',
          // color: thCtrl.isDarkModeOn
          //     ? AppColors.iconActiveColor
          //     : AppColors.buttonColor),
          // inactiveIcon: SvgPicture.asset('assets/icons/home_icon.svg',
          //     color: thCtrl.isDarkModeOn
          //         ? AppColors.iconInactiveColor
          //         : AppColors.buttonColor),
            activeColorPrimary: AppStyle().textHeading,
          inactiveColorPrimary: AppStyle().backgroundColor,
          ),
    ];
  }

}