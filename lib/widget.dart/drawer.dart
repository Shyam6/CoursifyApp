import 'package:flutter/material.dart';
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
           onTap: (){},
        ),
         ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
           onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.feedback),
          title: Text('Feedback'),
           onTap: (){},
        ),
         ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About'),
           onTap: (){},
        ),

      ],)
    );
  }
}