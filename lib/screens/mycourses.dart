import 'package:coursify_app/services/api_services.dart';
import 'package:coursify_app/widget.dart/coursecard.dart';
import 'package:flutter/material.dart';
import 'package:coursify_app/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
class courses extends StatefulWidget {
  const courses({ Key? key }) : super(key: key);

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
  @override
   Widget build(BuildContext context) {
 
   CourseProvider courseprovider = Provider.of<CourseProvider>(context);
   ToastContext().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          title: Text('Current Courses',style: TextStyle(
            fontSize : 24,
            fontWeight: FontWeight.bold,
          ),),   
        ),
        body: ListView.builder(
          itemCount: courseprovider.courses.length,
          itemBuilder: (context,index){

                 return mycoursecard(courseName: courseprovider.courses[index].courseName,instructorName: courseprovider.courses[index].instructorName,
                 id : courseprovider.courses[index].id,
                 lecturesFinished:courseprovider.courses[index].lecturesFinished,
                 noOfLectures: courseprovider.courses[index].noOfLectures,
                 noOfWeeks: courseprovider.courses[index].noOfWeeks,
                 weekdata: courseprovider.courses[index].weekdata,
                 remvlec: courseprovider.courses[index].remvlec,
                 noOfReminders: courseprovider.courses[index].noOfReminders,
                 );
          })
      ),
    );
  }
}
