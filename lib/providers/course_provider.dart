
import 'package:flutter/material.dart';
import 'package:coursify_app/models/course.dart';

class CourseProvider with ChangeNotifier{

List<Course> courses =[];

void addCourse(Course course){
   courses.add(course);
   notifyListeners();
}
void updateNote(String id,int lecfin){
  int idx = courses.indexOf(courses.firstWhere((element) => element.id==id));
  courses[idx].lecturesFinished += lecfin;
  if(courses[idx].remvlec.isEmpty==false){
  String key = courses[idx].remvlec.keys.last ;
  if(courses[idx].remvlec[key]!=-1){
    courses[idx].remvlec.addAll({"noRem":lecfin});
  }else{
  courses[idx].remvlec[key]=lecfin;}}
  else{
    courses[idx].remvlec.addAll({"noRem":lecfin});
  }
  notifyListeners();

}
void deleteNote(String id){
  int idx = courses.indexOf(courses.firstWhere((element) => element.id==id));
  courses.removeAt(idx);
  notifyListeners();
}
void updateRem(String id,Map reminder,int norem){
  int idx = courses.indexOf(courses.firstWhere((element) => element.id==id));
  courses[idx].noOfReminders += norem;
  courses[idx].remvlec.addAll(reminder);
  notifyListeners();
}




}