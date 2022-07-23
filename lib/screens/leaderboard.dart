import 'package:flutter/material.dart';

class leaderPage extends StatefulWidget {
  const leaderPage({ Key? key }) : super(key: key);

  @override
  State<leaderPage> createState() => _leaderPageState();
}

class _leaderPageState extends State<leaderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
       appBar: AppBar(
        title: Text("Leader Board"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
       ),
      body: Container(
        child: Column(
          children: [Text('Tudum')],
        ),
      ),

    ));
  }
}