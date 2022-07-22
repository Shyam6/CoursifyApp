import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child:Container(
          child:Column(
            children:[Text('About Coursify'),
            Text('This is an App where you can manage all your courses taken from various websites(in the initial version the app supports only Coursera courses).You can set the daily reminders for you courses and accordingly update the number of lectures that were finished.You can also view weekly status as per Coursera week structure and also see your Reminder vs No of Lectures plot which will motivate you to finish more lectures further.'),
            Text('Please follow these steps below to use app properly :'),
            Text('- Provide the link to your course(Coursera)'),
            Text('- Your course will get added in the My Courses page'),
            Text('- You can set reminders whenever you want to and after you finish the lectures update the number'),
             Text('- You can check the Reminder vs No of Lectures graph'),
             Text('- Delete the course if it is finished'),
            ]
          )
        ),)

    ));
  }
}