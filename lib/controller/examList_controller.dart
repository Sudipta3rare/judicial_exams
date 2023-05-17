import 'package:get/get.dart';
import 'package:judicial_exams/models/examList_model.dart';

class ExamListController extends GetxController{
  static ExamListController to = Get.find();


  List<int> selectedIndexList = [];

     List<ExamList> selectedExamList = [] ;
    List<ExamList> examList =<ExamList>[
      ExamList(
        examName: 'Exam Name',
        examSubtitle: 'This exam has a small subheading',
        examDate: '30/10/2023',
        examPrice: '500',
        examDuration: '3 hrs',
        examStatus: 'Not purchased',
        examDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc porta cursus ligula, et mattis massa dignissim laoreet. Aenean aliquet leo et eros pulvinar lobortis. Fusce sollicitudin vestibulum ligula et mollis. '
      ),
      ExamList(
        examName: 'Exam Name',
        examSubtitle: 'This exam has a small subheading',
        examDate: '30/10/2023',
        examPrice: '500',
        examDuration: '3 hrs',
        examStatus: 'Not purchased',
        examDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc porta cursus ligula, et mattis massa dignissim laoreet. Aenean aliquet leo et eros pulvinar lobortis. Fusce sollicitudin vestibulum ligula et mollis. '
      ),
      ExamList(
        examName: 'Exam Name',
        examSubtitle: 'This exam has a small subheading',
        examDate: '30/10/2023',
        examPrice: '500',
        examDuration: '3 hrs',
        examStatus: 'Not purchased',
        examDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc porta cursus ligula, et mattis massa dignissim laoreet. Aenean aliquet leo et eros pulvinar lobortis. Fusce sollicitudin vestibulum ligula et mollis. '
      ),
    ];

    void onPurchaseClicked() {


      for(var item in examList){
        if(item.examSelected && !selectedExamList.contains(item)){
         selectedExamList.add(item);
      }
        if(!item.examSelected && selectedExamList.contains(item)){
          selectedExamList.remove(item);
        }
      print(selectedExamList);
    }
}

  bool isItemPresent(ExamList item){
      var flag = 0;
      for (var i in selectedExamList){
        if(item.examName == i.examName){
          flag = 1;
          break;
        }
      }
      if(flag == 0){return true;}
    else {
        return false;
      }
    }


}