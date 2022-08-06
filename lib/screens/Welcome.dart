import 'package:coursify_app/screens/home.dart';
import 'package:coursify_app/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double sw = MediaQuery.of(context).size.width;
     double sh = MediaQuery.of(context).size.height;
     double spacing = sh-583.4;
     double s1 = ((spacing*16)/76);
     double s2 = ((spacing*60)/76);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: (sw-300)/2),
                  child: Image.asset('assests/welcomepng.png',height: 300,width:300)), 
                 
                Text('Welcome to Coursify',
                    style: TextStyle(
                      color: Colors.indigo,
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                    ),
                    textAlign : TextAlign.left,
                    ),
              
                  SizedBox(height: s1,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Text('A place to manage,set reminders and keep track of all your courses',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                       fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                   ),
               ),
         
               SizedBox(height: s2,),
               ElevatedButton(onPressed: () async {

                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('setlogin', true);

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Namepage()));
               },
                child: Text('Get started',
               style: TextStyle(
                fontSize: 20,
                color: Colors.indigo,
                fontWeight: FontWeight.bold
               ),
               ),
                style:ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                )
               ),
            ],
          ),
      ),
    );
  }
}