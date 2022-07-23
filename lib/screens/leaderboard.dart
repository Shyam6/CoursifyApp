import 'package:coursify_app/providers/leaderboard_provider.dart';
import 'package:coursify_app/widget.dart/friendtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class leaderPage extends StatefulWidget {
  const leaderPage({ Key? key }) : super(key: key);

  @override
  State<leaderPage> createState() => _leaderPageState();
}

class _leaderPageState extends State<leaderPage> {
  @override
  Widget build(BuildContext context) {
  
     LeaderProvider leadprov = Provider.of<LeaderProvider>(context);

    return SafeArea(child: Scaffold(
       appBar: AppBar(
        title: Text("Leader Board"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
       ),
      body: 
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [SizedBox(height: 10),Row(
            mainAxisSize: MainAxisSize.min,
           children:[
      Padding(padding:EdgeInsets.only(left: 40),child:Text("Friend",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
          Padding(padding:EdgeInsets.only(left: 105),child: Text("Courses Finished",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))],)
           
           ,SizedBox(height: 10),
         Container(  height: 550,child:  ListView.builder(

                      itemCount: leadprov.friends.length,
                      itemBuilder: (context,index){
            
                   return friendTile(name:leadprov.friends[index].name,coursesfinished:leadprov.friends[index].coursesfinished);
                   
                      })),
            
          
           ],
      ),

    ));
  }
}