import 'package:coursify_app/providers/course_provider.dart';
import 'package:coursify_app/screens/Welcome.dart';
import 'package:coursify_app/screens/home.dart';
import 'package:coursify_app/screens/signIn.dart';
import 'package:coursify_app/screens/signUp.dart';
import 'package:coursify_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

bool actualScreen = false;
Widget firstWidget = welcomescreen();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  actualScreen = prefs.getBool('setlogin')??false;
  if(actualScreen){
     firstWidget = Namepage();
  }
  if(prefs.getString('username')!=null&&prefs.getString('username')!.isEmpty==false){
      firstWidget = HomePage();
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return MultiProvider(providers: [
    
    ChangeNotifierProvider(create: (context)=>CourseProvider()),
   

    ],
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    home: firstWidget
    ),
    );

  }
}

//https://www.coursera.org/learn/java-object-oriented-programming
//second commit test