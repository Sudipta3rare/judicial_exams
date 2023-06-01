import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/submit_exam_controller.dart';
import '../../utils/styles.dart';
import '../components/custom_button.dart';

class SubmitExamPage extends StatelessWidget {
  const SubmitExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle().secondaryColor,
        title: Text(
          "Submit Answer",
          style: GoogleFonts.montserrat(
            color: AppStyle().textHeading,
          ),
        ),
      ),
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SubmitExamController>(builder: (ctrl) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                child: Text(
                  "Submit your answer script within the given time",
                  style: AppStyle().subheadingBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(() => Center(
                    child: Text(
                      ctrl.tmCtrl.time.value,
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: AppStyle().button,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    ctrl.selectAndDisplayPdf();
                    ctrl.update();
                  },
                  child:
                      CustomButton().customButtonSmall(context, "Select File")),
              _showPdf(ctrl, context),
            ],
          ),
        );
      }),
    );
  }

  Widget _showPdf(SubmitExamController ctrl, BuildContext context) {
    return Obx(
      () => ctrl.selectedPdf.value != null
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: PDFView(
                    swipeHorizontal: true,
                    enableSwipe: true,
                    pageFling: true,
                    fitEachPage: true,
                    pageSnap: true,
                    filePath: ctrl.selectedPdf.value!.path,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      ctrl.tmCtrl.onClose();
                      ctrl.onSubmitFile();
                    },
                    child: CustomButton().customButton200(context, "Submit"))
              ],
            )
          : SizedBox(),
    );
  }
}
