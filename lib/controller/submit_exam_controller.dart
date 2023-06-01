import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/controller/timer_controller.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SubmitExamController extends GetxController {
  static SubmitExamController to = Get.find();

  TimerController tmCtrl = TimerController.to;

  final Rx<File?> selectedPdf = Rx<File?>(null);

  void onInit() {
    super.onInit();
    startSubmitTimer();
  }

  void selectAndDisplayPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedPdf.value = File(result.files.single.path!);
    }
  }

  void startSubmitTimer() {
    tmCtrl.startTimer(15, () {
      //onSubmitFile();
    });
  }

  void onClose() {
    print("On close active");
    tmCtrl.onClose();
  }

  Future<void> onSubmitFile() async {
    if (selectedPdf.value != null) {
      File file = selectedPdf.value!;
      String? userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('users')
            .child(userId)
            .child('ExamResult.pdf');

        firebase_storage.UploadTask uploadTask = ref.putFile(file);

        firebase_storage.TaskSnapshot taskSnapshot =
            await uploadTask.whenComplete(() => null);

        taskSnapshot.ref.getDownloadURL().then((url) {
          print("File uploaded successfully. Download URL: $url");
        });
      } else {
        print("User not authenticated.");
      }
    } else {
      print("No selected PDF file.");
    }
  }
}
