import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({ Key? key }) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('Settings'),
      centerTitle: true,
    ) ,
    body: Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text('Change Username')),
          ToggleButtons(children: [Text('Light Mode'),Text('Dark mode')], isSelected: [true,false])
        ],
      ),
    ),));
  }
}