import 'package:coursify_app/models/course.dart';
import 'package:coursify_app/providers/leaderboard_provider.dart';
import 'package:coursify_app/screens/leaderboard.dart';
import 'package:coursify_app/screens/mycourses.dart';
import 'package:coursify_app/screens/signIn.dart';
import 'package:coursify_app/widget.dart/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coursify_app/providers/course_provider.dart';
import 'package:coursify_app/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var controller = TextEditingController();
 
  Widget build(BuildContext context) {
    AppBar appb = AppBar(
          iconTheme: IconThemeData(color: Colors.white,size: 24),
          title : Text('Coursify',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          centerTitle: true,
          actions: <Widget>[IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('username');
      LeaderProvider leadprov = Provider.of<LeaderProvider>(context,listen: false);
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Namepage()));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyApp()), (route) => false);
      },)],
          elevation: 0,
          backgroundColor: Colors.blue[900]
        );
     double sw = MediaQuery.of(context).size.width;
     double sh = MediaQuery.of(context).size.height;
     double uph = MediaQuery.of(context).padding.top;
     double appbarh = appb.preferredSize.height;
     sh = sh-uph-appbarh-550;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: drawer(),
        appBar: appb,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sh/2),
            Padding(
              padding: EdgeInsets.only(left: 17),
              child:
                Text('Add a course',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

                ),
            ),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border : OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Give the link of the course',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add,color:Colors.blue[900]),
                    onPressed: () async {
                      String name = "No Name";
                     var prefs = await SharedPreferences.getInstance();
                      name = prefs.getString('username').toString();   
                       Map<String,dynamic> mp = {
                       "id": const Uuid().v1().toString(),
                        "userid":name,
                      };
                      var res = await CourseApi.addCourse(mp,controller.text);
                     var courseresponse =  await CourseApi.courseInfo(mp["id"]);
                     print(mp["id"]);
                     if(!courseresponse.isEmpty){
                       Course currentcourse = Course.fromMap(courseresponse) ;
                       print(currentcourse.id);
                     Provider.of<CourseProvider>(context,listen: false).addCourse(currentcourse);
                     }
                   //  print(res);
                     ToastContext().init(context);
                    Toast.show(res,duration: 2);
                    controller.clear();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: (sw-167)/2),
            child: ElevatedButton.icon(onPressed : (){
              Navigator.push(context, MaterialPageRoute(builder: (Context)=>courses()));
            }, 
            icon: Icon(Icons.laptop),
            label: Text('My Courses',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
            ),
            )),
            SizedBox(height: 20,),
             Padding(
            padding: EdgeInsets.symmetric(horizontal: (sw-174)/2),
            child:ElevatedButton.icon(onPressed : (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>leaderPage()));
            }, 
            icon: Icon(Icons.list),
            label: Text('Leaderboard',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
            ),
            )),
            SizedBox(height: 10,),
            Padding(padding:EdgeInsets.symmetric(horizontal: (sw-300)/2),child:Image.asset('assests/homepng.png',height:300,width:300)),
          ],
        ),
      ),
    );
  }
}
