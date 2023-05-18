import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:judicial_exams/login.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import '../../utils/styles.dart';


class SliderComponent{
  Widget textPara(BuildContext context,String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('$title',
        textAlign: TextAlign.center,
        style: AppStyle().sliderPara,
      ),
    );
  }

  Widget textHeading(BuildContext context,String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        '$title',
        textAlign: TextAlign.center,
        style: AppStyle().sliderHeading,
      ),
    );
  }

  Widget sliderImage(BuildContext context, String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SvgPicture.asset(asset),
    );
  }
}
class Slider1 extends StatelessWidget {
   Slider1({Key? key}) : super(key: key);
   // this.title,this.para, this.buttonText,this.route
  // String title;
  // String para;
  // String buttonText;
  // String route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/background.png"),
             fit: BoxFit.cover,
             opacity: 0.1
           ),
         ),
         child: ListView(
                children: [
                  SliderComponent().sliderImage(context, "assets/slider1.svg"),



                  SliderComponent().textHeading(context, "Mock up your dreams"),

                  SizedBox(height: 10,),

                  SliderComponent().textPara(context, "Set your path using expert made judicial mock tests"),

                  SizedBox(height: 10,),

                  GestureDetector(

                      onTap: ()=> Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return Slider2();
                              })),
                      child: CustomButton().customButton200(context, "Next"))
                ],
         ),
       ),
      ),
    );
  }
}class Slider2 extends StatelessWidget {
   Slider2({Key? key}) : super(key: key);
   // this.title,this.para, this.buttonText,this.route
  // String title;
  // String para;
  // String buttonText;
  // String route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/background.png"),
             fit: BoxFit.cover,
             opacity: 0.1
           ),
         ),
         child: ListView(
                children: [
                  SliderComponent().sliderImage(context, "assets/slider2.svg"),



                  SliderComponent().textHeading(context, "Catch up the pace"),

                  SizedBox(height: 10,),

                  SliderComponent().textPara(context, "Set your path using expert made judicial mock tests"),

                  SizedBox(height: 10,),

                  GestureDetector(
                      onTap: ()=> Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return Slider3();
                              })),
                      child: CustomButton().customButton200(context, "Next"))
                ],
         ),
       ),
      ),
    );
  }
}class Slider3 extends StatelessWidget {
   Slider3({Key? key}) : super(key: key);
   // this.title,this.para, this.buttonText,this.route
  // String title;
  // String para;
  // String buttonText;
  // String route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/background.png"),
             fit: BoxFit.cover,
             opacity: 0.1
           ),
         ),
         child: ListView(
                children: [
                  SliderComponent().sliderImage(context, "assets/slider3.svg"),



                  SliderComponent().textHeading(context, "Be law ready"),

                  SizedBox(height: 10,),

                  SliderComponent().textPara(context, "Set your path using expert made judicial mock tests"),

                  SizedBox(height: 10,),

                  GestureDetector(
                      onTap: ()=> Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyLogin();
                            })),

                      child: CustomButton().customButton200(context, "Get Started"))
                ],
         ),
       ),
      ),
    );
  }
}
