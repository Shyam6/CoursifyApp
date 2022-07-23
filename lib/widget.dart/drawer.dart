import 'dart:ui';
import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/providers/leaderboard_provider.dart';
import 'package:coursify_app/screens/about.dart';
import 'package:coursify_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 String ans ="";
class drawer extends StatefulWidget {
  const drawer({ Key? key }) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override

  Widget build(BuildContext context) {
    LeaderProvider leadprov = Provider.of<LeaderProvider>(context);
     SharedPreferences.getInstance().then((prefs) {   
      setState(() {
        ans = prefs.getString('username').toString();
      });
      }); 
    return Drawer (child:Column(
      children: [
        Container(
           height: 100,
          width: double.infinity,
           color: Colors.blue[900],
           child: Center(child: Text(ans,style: TextStyle(color: Colors.white,fontSize: 24,
           //fontWeight: FontWeight.bold,
           ),),)
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Friends'),
           onTap: (){
           friend neww = friend(name: "Shyam", coursesfinished: 5);
            leadprov.addFriend(neww);
           },
        ),
         ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>settingsPage()));
           },
        ),
        ListTile(
          leading: Icon(Icons.feedback),
          title: Text('Feedback'),
           onTap: (){
            showDialog(context: context, builder: (BuildContext context){
                          return BackdropFilter(
                            filter: ImageFilter.blur(),
                            child: AlertDialog(content:Column(children:[Text('To give the feedback about the application please send a mail to the following email'),
                            
                            ],mainAxisSize: MainAxisSize.min,)));

           },);}
        ),
         ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About'),
           onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>aboutPage()));
           },
        ),

      ],)
    );
  }
}