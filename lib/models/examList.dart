class ExamList {
  String examNumber;
  String examName;
  String examDate;
  String examPrice;
  String examStatus;
  String examDescription;
  String examSubtitle;
  String examDuration;
  bool examSelected = false;
  ExamList({
   this.examName ='',
   this.examNumber='',
   this.examDate='',
   this.examDescription='',
   this.examPrice='',
   this.examStatus='',
   this.examSubtitle='',
    this.examDuration ='',

});
  void toggleIsSelected(){
    examSelected= !examSelected;
  }
}