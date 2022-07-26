import 'package:flutter/material.dart';

class friendTile extends StatefulWidget {
  const friendTile({ Key? key,required this.name,required this.coursesfinished }) : super(key: key);
final String name ;
 final int coursesfinished;
  @override
  State<friendTile> createState() => _friendTileState();
}

class _friendTileState extends State<friendTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text(widget.name.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),Text(":",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),Text("${widget.coursesfinished}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400))],
      ),
    );
  }
}