import 'package:get/get.dart';
import 'package:judicial_exams/models/exam_log_model.dart';

class ExamLogController extends GetxController{
  static ExamLogController to = Get.find();

  List<ExamLogModel> examLogList = <ExamLogModel>[
    ExamLogModel(examName: "Exam Name", examAttendedDate: '20/4/2023', examMarks: '80/100'),
    ExamLogModel(examName: "Exam Name", examAttendedDate: '20/4/2023', examMarks: '30/100'),
    ExamLogModel(examName: "Exam Name", examAttendedDate: '20/4/2023', examMarks: '--/100'),
  ];
}