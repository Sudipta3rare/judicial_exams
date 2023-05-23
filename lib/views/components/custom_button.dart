import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class CustomButton{
  Widget customButton200(context, String title, ){
    return Container(
      height: 50,
      // width: 20,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding:  EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: const Color.fromARGB(255, 112, 91, 222),
          // color: Colors.blue.shade900,
          gradient:  LinearGradient(colors: [
            // Colors.blueAccent,
            Colors.purple[800]!,
            Color(0xff3e1558),

          ])),
      child: Center(
        child: Text(

          '$title',
          style:
          GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,


          ),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget customButtonMedium(context, String title){
    return Container(
      width: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.fromLTRB(2,3,2,3),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color.fromARGB(255, 112, 91, 222),
        color: AppStyle().button,
        // gradient: const LinearGradient(colors: [
        //   Colors.blueAccent,
        //   Colors.lightBlueAccent
        // ]
        // )
      ),
      child: Center(
        child: Text(
          '$title',
          style:
          GoogleFonts.montserrat(
            color: AppStyle().textHeading,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget customButtonSmall(context, String title){
    return Container(
      // height: 50,
      width: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.fromLTRB(2,3,2,3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color.fromARGB(255, 112, 91, 222),
        color: AppStyle().button,
        // gradient: const LinearGradient(colors: [
        //   Colors.blueAccent,
        //   Colors.lightBlueAccent
        // ]
        // )
      ),
      child: Center(
        child: Text(
          '$title',
          style:
          GoogleFonts.montserrat(
            color: AppStyle().textHeading,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}