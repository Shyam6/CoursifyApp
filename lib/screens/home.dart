import 'package:coursify_app/models/course.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var controller = TextEditingController();
 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: drawer(),
        appBar: AppBar(
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Namepage()));
      },)],
          elevation: 0,
          backgroundColor: Colors.blue[900]
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
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
                       Map<String,dynamic> mp = {
                       "id": const Uuid().v1().toString(),
                        "userid":"Shyam",
                      };
                      var res = await CourseApi.addCourse(mp,controller.text);
                     var courseresponse =  await CourseApi.courseInfo(mp["id"]);
                     if(!courseresponse.isEmpty){
                       Course currentcourse = Course.fromMap(courseresponse) ;
                     Provider.of<CourseProvider>(context,listen: false).addCourse(currentcourse);
                     }
                     print(res);
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
            padding: EdgeInsets.symmetric(horizontal: 122.2),
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
            padding: EdgeInsets.symmetric(horizontal: 118.7),
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
            Padding(padding:EdgeInsets.symmetric(horizontal: 55.7),child:Image.asset('assests/homepng.png',height:300,width:300)),
          ],
        ),
      ),
    );
  }
}
