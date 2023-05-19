import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/start_exam_controller.dart';
import 'package:judicial_exams/models/purchasedList_model.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pspdfkit_flutter/pspdfkit.dart';


import '../pdf_view.dart';

class StartExamPage extends StatelessWidget {
  StartExamPage(
    this.examDetials, {
    Key? key,
  }) : super(key: key);

  PurchasedExamList examDetials;

  static const fileName = '/pspdfkit-flutter-quickstart-guide.pdf';
  static const imageUrl = 'https://pspdfkit.com/downloads' + fileName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text(
          examDetials.examName,
          style: GoogleFonts.montserrat(color: AppStyle().textHeading),
        ),
      ),
      backgroundColor: AppStyle().backgroundColor,
      //To display contents of start exam body
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return GetBuilder<StartExamController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

            children: <Widget>[

              showListItem(context),
               Text(
                'First, download a PDF file. Then open & Start Exam.',style:  AppStyle().subheadingBlack,
              ),
              SizedBox(
                height: 15 ,
              ),
              Visibility(
                visible: !ctrl.didDownloadPDF,
                child: InkWell(
                    onTap: ctrl.didDownloadPDF
        ? null
            : () async {
        var tempDir = await getTemporaryDirectory();
        ctrl.download(Dio(), imageUrl, tempDir.path + fileName);
        },
                    child: CustomButton().customButtonSmall(context, "Download Test Pdf")),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                ctrl.progressString, style: AppStyle().defaultText,
              ),
                Spacer(),
              Visibility(
                visible: ctrl.didDownloadPDF,
                child: InkWell(
                    onTap: !ctrl.didDownloadPDF
                        ? null
                        : () async {
                      var tempDir = await getTemporaryDirectory();
                      // await Pspdfkit.present(tempDir.path + fileName);
                        Get.dialog(
                          AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            // contentPadding: EdgeInsets.only(top: 10.0),
                            backgroundColor: AppStyle().textHeading,
                            actions: [
                              IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.cancel,color: AppStyle().button,))
                            ],
                            content: Container(

                              height: 200,
                              width: MediaQuery.of(context).size.width ,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text("TEST IS ABOUT TO START !", style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),textAlign: TextAlign.center,),
                                  SizedBox(height: 15,),

                                  Text("Start exam ${examDetials.examName} for ${examDetials.examDuration} hrs", style: AppStyle().sliderPara, ),
                                  SizedBox(height: 15,),

                                  GestureDetector(child: CustomButton().customButtonSmall(context, 'Start Exam'),
                                  onTap: () => Get.offAll(PdfViewPage(path: tempDir.path+fileName, examName:   examDetials.examName.toString(),
                                  ),
                                  ),
                                  )
                                ],
                              ),
                            ),
                          )
                        );
                        // Get.offAll(PdfViewPage(path: tempDir.path+fileName, examName:   examDetials.examName.toString(),));
                   ctrl.startTimer(int.parse(examDetials.examDuration)*60*60);
                    },
                    child: CustomButton().customButton200(context, "Start Exam")),
              ),

              SizedBox(height: 30,)
            ]),
      );
    });
  }

  Widget showListItem(context){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          child:Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(examDetials.examName, style:
                          GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(examDetials.examTitle, style:
                          GoogleFonts.montserrat(

                            // fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(' ${examDetials.examDuration} hr', style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppStyle().secondaryColor
                      ),),
                    ),
                  ],
          ),
        ),
        Text('This exam is dated on : ${examDetials.examDate}', style:
        AppStyle().subheadingBlack,),
        SizedBox(height: 10,),
        Text('Exam status : ${examDetials.examStatus}', style:
       AppStyle().defaultText),
        SizedBox(height: 10,),

        Divider(
          color: AppStyle().primaryColor,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(height: 40,),

      ],
    );
  }
}
