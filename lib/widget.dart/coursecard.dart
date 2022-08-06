import 'dart:convert';
import 'dart:ui';
import 'package:coursify_app/providers/leaderboard_provider.dart';
import 'package:coursify_app/screens/stats.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter/material.dart';
import 'package:coursify_app/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:coursify_app/services/api_services.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class mycoursecard extends StatefulWidget {
  const mycoursecard({ Key? key , required this.courseName,required this.instructorName,required this.id,required this.lecturesFinished,
  required this.noOfLectures,required this.noOfWeeks,required this.weekdata,required this.remvlec,required this.noOfReminders,required this.url,required this.noOfNoRems}) : super(key: key);
   final String courseName ;
  final String  instructorName ;
  final String id;
  final int lecturesFinished;
  final int noOfLectures;
  final int noOfWeeks;
  final Map weekdata;
  final int noOfReminders;
  final Map remvlec;
  final String url;
  final int noOfNoRems;
  @override
  State<mycoursecard> createState() => _mycoursecardState();
   
}

class _mycoursecardState extends State<mycoursecard> {
  
  var hourcontroller = TextEditingController();
  var minutecontroller = TextEditingController();
  var leccontroller = TextEditingController();
  Map remcounter = {};
  @override
 
  Widget build(BuildContext context) {
  
  LeaderProvider leadprov = Provider.of<LeaderProvider>(context);
    double sw = MediaQuery.of(context).size.width;
    double sw2 = sw-8-283.4;
    sw=sw-50;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey[300],
      child: 
               Column(
                mainAxisSize: MainAxisSize.min,
                 children: [
                 Padding(padding: EdgeInsets.fromLTRB(10,10,0,0),child: Text(widget.courseName,style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,
                          ),maxLines: 1,overflow:TextOverflow.ellipsis ,)),
            Row(   
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [SizedBox(height: 10.0), 
                       Padding(padding: EdgeInsets.fromLTRB(10,0,0,0),child: Text('Instructor : '+widget.instructorName,style: TextStyle(fontSize: 15,color: Colors.grey,),)),
                         Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10,0,0,0),child: Text('Total lectures finished',style: TextStyle(fontSize: 15,color: Colors.grey,),)),
                        SizedBox(width:15),
                        Text('-    '+widget.lecturesFinished.toString(),style: TextStyle(fontSize: 15,color: Colors.grey,),),   
                        IconButton(onPressed: (){
                           showDialog(context: context, builder: (BuildContext context){
                          return BackdropFilter(
                            filter: ImageFilter.blur(),
                            child: AlertDialog(content : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[Text('Finished Lecture'),SizedBox(width: 20,),
                                  Container(child:TextField(
                                    controller: leccontroller,
                                    keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  
                                  ),
                                  ),
                                  width: 50,
                                  height: 30 ,
                                  )
                                  ],
                                  
                                  ),
                                  TextButton(
                       child: Text(
                     'Done',
              style: TextStyle(fontSize: 18.0,
              color: Colors.blue[900]
              ),
            ),
            onPressed: () async{
              int lecfin = widget.lecturesFinished+ int.parse(leccontroller.text); 
             Provider.of<CourseProvider>(context,listen: false).updateNote(widget.id,int.parse(leccontroller.text),widget.noOfNoRems);
             if(lecfin>=widget.noOfLectures){
              var cf = await authService.setCoursesFinished();
             // print(cf);
              if(cf!="Couldnot update finished courses"){
                int coursesfinished = int.parse(cf);
                leadprov.updateCoursesfinished(coursesfinished);
              }
              else{
                print(cf);
              }
             }
            // print(5);
       Map<String,dynamic>   map = {"lecturesFinished":lecfin.toString(),"remvlec":json.encode(widget.remvlec),"noOfReminders":widget.noOfReminders.toString(),"noOfNoRems":widget.noOfNoRems.toString()};
             var res = await CourseApi.updateCourse(widget.id, map);

              Toast.show(res);
             Navigator.pop(context);
            },
          ),
                              ],
                            )));});
                        }, icon: Icon(Icons.add,color: Colors.grey,size: 15,),splashRadius: 15,)
                      ],
                    ),
                        
                        ],
                       ),
                      Container(height: 76,child: IconButton(onPressed: () async {
                       await launchUrlString(widget.url);

                      }, icon: Image.asset('assests/coursera.png',),iconSize: sw2,padding: EdgeInsets.all(0),))
                     ],
                   ),
                   
                   ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width:sw/3,child:OutlinedButton(onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return BackdropFilter(
                            child: AlertDialog(content : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Container(
                                    height: 60,
                                    width: 60,
                                    child: TextField(
                                      controller: hourcontroller,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),SizedBox(width: 30,),Container(
                                    height: 60,
                                    width: 60,
                                    child: TextField(
                                      controller: minutecontroller,
                                      keyboardType: TextInputType.number,
                                    ),
                                  )],
                                ),
                                Container(
                               margin: const EdgeInsets.all(25),
          child: TextButton(
            
            child: Text(
              'Create alarm',
              style: TextStyle(fontSize: 20.0,
              color: Colors.blue[900]
              ),
            ),
            onPressed: () {
              int hour;
              int minutes;
              hour = int.parse(hourcontroller.text);
              minutes = int.parse(minutecontroller.text);
              FlutterAlarmClock.createAlarm(hour, minutes);
              Map rem = {"Rem${widget.noOfReminders+1}":-1};
              Provider.of<CourseProvider>(context,listen: false).updateRem(widget.id,rem,widget.noOfReminders+1);
            },
          ),
        ),
                              ],
                            ),),
                            filter: ImageFilter.blur()) ;
                        });
                      },style: OutlinedButton.styleFrom(primary: Colors.blue[900]) ,child: Text('Set Reminder',style: TextStyle(color: Colors.blue[900]),))),
                    Container(width:sw/3,child:   OutlinedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>stats(noOfLectures: widget.noOfLectures, lecturesFinished: widget.lecturesFinished, noOfWeeks: widget.noOfWeeks, weekdata: widget.weekdata,remvlec: widget.remvlec,)));
                      },style: OutlinedButton.styleFrom(primary: Colors.blue[900]) , child: Text('Get Statistics',style: TextStyle(color: Colors.blue[900])))),
                Container(width:sw/3,child: OutlinedButton(onPressed: () async {
                     // print(widget.id);
                        Provider.of<CourseProvider>(context,listen: false).deleteNote(widget.id);
                        var res = await CourseApi.deleteCourse(widget.id);
                          
                    Toast.show(res);
                     }, style: OutlinedButton.styleFrom(primary: Colors.blue[900]) ,child: Text('Delete Course',style: TextStyle(color: Colors.blue[900])))),
                    ],
                   )
                 ],
               ),   
      );
  }
}