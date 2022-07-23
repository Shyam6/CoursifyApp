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
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text(widget.name.toString()),Text(":"),Text("${widget.coursesfinished}")],
      ),
    );
  }
}