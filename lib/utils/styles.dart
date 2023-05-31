import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppStyle {
  Color primaryColor = Color(0xffc89ce4);
  Color secondaryColor = Color(0xff634975);
  Color button = Color(0xff3e1558);
  Color textHeading = Colors.white;
  Color backgroundColor = Colors.purple.shade50;


  TextStyle sliderHeading =GoogleFonts.montserrat(fontSize: 30  , fontWeight: FontWeight.bold);


  TextStyle subheadingNormal = GoogleFonts.montserrat
    (
    fontSize: 16,

  );


  TextStyle subheadingBlack =  GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );


  TextStyle subheadingBig =  GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  TextStyle defaultText =  GoogleFonts.montserrat();

}