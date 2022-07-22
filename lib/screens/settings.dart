import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Widget changeusername = SizedBox(height: 0,);

class settingsPage extends StatefulWidget {
  const settingsPage({ Key? key }) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    var usercontroller = TextEditingController();
    return SafeArea(child: Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue[900],
      title: Text('Settings'),
      centerTitle: true,
    ) ,
    body: Container(
      child: Column(

        children: [
       Container(child: ElevatedButton(onPressed: (){
           setState(() {
             changeusername = Row(
           
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                
              Text('Set Username',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),SizedBox(width: 10,),Container(
                child: TextField(
                  controller: usercontroller,
                  decoration: InputDecoration(
                     contentPadding: EdgeInsets.all(5),
                  border : OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                width: 100,
                height: 30,
              ),SizedBox(width: 10,),TextButton(onPressed: (){

                usercontroller.clear();
                setState(() {
                   changeusername = SizedBox(height: 0,);
                });
                ToastContext().init(context);
                    Toast.show('Username Changed');
              }, child: Text('Update'))]
            );
           }); 
         }, child: Text('Change Username')),width: 200,),
         SizedBox(height:40),
         changeusername
        ],
      ),
    ),));
  }
}