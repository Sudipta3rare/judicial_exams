import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/controller/start_exam_controller.dart';
import 'package:judicial_exams/utils/styles.dart';

class PdfViewPage extends StatelessWidget {
   PdfViewPage({Key? key,
  required this.path,
   required this.examName}) : super(key: key);
  String path;
  String examName;

   final Completer<PDFViewController> _controller =
   Completer<PDFViewController>();
   int? pages = 0;
   int? currentPage = 0;
   bool isReady = false;
   String errorMessage = '';


  @override
  Widget build(BuildContext context) {
    print(path);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text(examName, style: GoogleFonts.montserrat(
          color: AppStyle().textHeading,
        ),),
      ),
      body: GetBuilder<StartExamController>(
        builder: (ctrl) {

          return Stack(
                children: [



                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,20,8,8),
                    child: PDFView(filePath:  path,
                    swipeHorizontal: true,
                    enableSwipe: true,

                    pageFling: true,
                    fitEachPage: true,
                    pageSnap: true,
                      defaultPage: currentPage!,
                      fitPolicy: FitPolicy.BOTH,
                      preventLinkNavigation:
                      false, // if set to true the link is handled in flutter
                      onRender: (_pages) {

                          pages = _pages;
                          isReady = true;
                      ctrl.update();
                      },
                      onError: (error) {

                          errorMessage = error.toString();
                        ctrl.update();
                        print(error.toString());
                      },
                      onPageError: (page, error) {

                          errorMessage = '$page: ${error.toString()}';
             ctrl.update();
                        print('$page: ${error.toString()}');
                      },
                      onViewCreated: (PDFViewController pdfViewController) {
                        _controller.complete(pdfViewController);
                      },
                      onLinkHandler: (String? uri) {
                        print('goto uri: $uri');
                      },
                      onPageChanged: (int? page, int? total) {
                        print('page change: $page/$total');
                         // totalPage = total;
                          currentPage = page;
                      ctrl.update();
                      },
                    ),
                  ),
                  Positioned(

                    top: 10,
                    right: 10,
                    left: 10,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: AppStyle().primaryColor,
                      child: Obx(
                              ()=>Center(
                            child: Text('${ctrl.time.value} m:s', style: GoogleFonts.montserrat(
                              fontSize: 30,
                              color: AppStyle().textHeading
                            ),
                            ),
                          )
                      ),
                    ),
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.width/2,
                      top: MediaQuery.of(context).size.height*0.85,
                      child: Text('${currentPage! + 1} / $pages', style: GoogleFonts.montserrat(

                      ),)),
                ],
              );
        }
      )
    );
  }

}
