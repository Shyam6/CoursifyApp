import 'dart:ui';
import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/providers/leaderboard_provider.dart';
import 'package:coursify_app/screens/about.dart';
import 'package:coursify_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
 String ans ="";
class drawer extends StatefulWidget {
  const drawer({ Key? key }) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override

  Widget build(BuildContext context) {
    var friendcontroller = TextEditingController();
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
          //  friend neww = friend(name: "Shyam", coursesfinished: 5);
          //   leadprov.addFriend(neww);
          showDialog(context: context, builder: (BuildContext context){
             ToastContext().init(context);
                          return BackdropFilter(
                            filter: ImageFilter.blur(),
                            child: AlertDialog(
                              
                content : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add your friends"),
                    SizedBox(height:15),
                    TextField(
                      controller: friendcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter friend's username",
                         contentPadding: EdgeInsets.all(10),
                  border : OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add,color:Colors.blue[900]),
                    onPressed: () async {
                      int cf ;
                      var res = await authService.addFriend(friendcontroller.text,ans);
                      if(res=="user added"){
                        var coursesfinished = await authService.getFriendDets(friendcontroller.text);
                        if(coursesfinished!="Could not find the details due error"){
                           cf = int.parse(coursesfinished);
                            leadprov.addFriend(friend(name: friendcontroller.text, coursesfinished: cf));
                            Toast.show(res);
                        }
                        else{
                          Toast.show("User added but couldn't get the details due to error");
                        }
                      }
                      else{
                      
                    Toast.show(res);}
                    },
                  ),
                      ),            
                     
                    )
                  ],
                )));});



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
                            InkWell(
              child: Text('ranganshyamsundar@gmail.com'),
              onTap: () async {
                String uri = 'mailto:ranganshyamsundar@gmail.com';
                 if(await canLaunchUrl(Uri.parse(uri))){
                  launchUrl(Uri.parse(uri));
                 }
              }
          ),
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