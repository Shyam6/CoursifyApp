import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('About Coursify'),
        centerTitle: true,
      ),
      body: Center(
        child:Container(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('This is an App where you can manage all your courses taken from various websites(in the initial version the app supports only Coursera courses).You can set the daily reminders for you courses and accordingly update the number of lectures that were finished.You can also view weekly status as per Coursera week structure and also see your Reminder vs No of Lectures plot which will motivate you to finish more lectures further.',
             
              ),
            ),
            Divider(color: Colors.grey,indent: 20,endIndent: 20,),
            
           Padding(padding: const EdgeInsets.all(8.0),child:Text('Please follow these steps below to use app properly :',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w500),) ,) ,
            Padding(padding: const EdgeInsets.all(8.0),child: Text('Provide the link to your course(Coursera)')),
          Padding(padding: const EdgeInsets.all(8.0),child:Text('Your course will get added in the My Courses page')),
        Padding(padding: const EdgeInsets.all(8.0),child:Text('You can set reminders whenever you want to and after you finish the lectures update the number')),
       Padding(padding: const EdgeInsets.all(8.0),child:Text('You can check the Reminder vs No of Lectures graph')),
       Padding(padding: const EdgeInsets.all(8.0),child:Text('Delete the course if it is finished')),
        new Divider(color: Colors.grey,indent: 20,endIndent: 20,),
            
            ]
          )
        ),)

    ));
  }
}