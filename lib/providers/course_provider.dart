
import 'package:coursify_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:coursify_app/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseProvider with ChangeNotifier{


bool isloading = true;
List<Course> courses =[];

CourseProvider() {
  
  coursefetch();
}



void addCourse(Course course){
   courses.add(course);
   notifyListeners();
}
void updateNote(String id,int lecfin,int n){
  int idx = courses.indexOf(courses.firstWhere((element) => element.id==id));
  courses[idx].lecturesFinished += lecfin;
  if(courses[idx].remvlec.isEmpty==false){
  String key = courses[idx].remvlec.keys.last ;
  if(courses[idx].remvlec[key]!=-1){
    courses[idx].remvlec.addAll({"noRem${n+1}":lecfin});
    courses[idx].noOfNoRems=n+1;
  }else{
  courses[idx].remvlec[key]=lecfin;}}
  else{
    courses[idx].remvlec.addAll({"noRem${n+1}":lecfin});
    courses[idx].noOfNoRems=n+1;
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
void coursefetch()async{
   final prefs = await SharedPreferences.getInstance();
   courses = await CourseApi.coursefetch(prefs.getString('username').toString());
   isloading = false;
   notifyListeners();
 }

}