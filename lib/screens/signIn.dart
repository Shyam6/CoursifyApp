import 'package:coursify_app/screens/home.dart';
import 'package:coursify_app/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:toast/toast.dart';
class Namepage extends StatefulWidget {
  const Namepage({ Key? key }) : super(key: key);

  @override
  State<Namepage> createState() => _NamepageState();
}

class _NamepageState extends State<Namepage> {
  @override


  final _formkey = GlobalKey<FormState>();
  String username = "" ;
  String password = "";

  var passcontroller = TextEditingController();
  var usercontroller = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[100],
        body: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
           Form(
        key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
             Container( width: 350,child:  TextFormField(
              controller: usercontroller,
                decoration: InputDecoration(hintText: "Enter your Username"),
                validator: (val) => val!.isEmpty ?"Enter a Username":null,
                onChanged: (val){
                    username = val;
                   
                },
              )),
              SizedBox(height: 20.0),
             Container( width: 350,child:TextFormField(
               controller: passcontroller,
             decoration : InputDecoration(hintText: "Enter your password"),
             validator: (val) => val!.length<6 ?"Enter a password 6+ chars long":null,
                obscureText: true,
                onChanged: (val){
                    password = val;
                },
              ),),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink),
                onPressed: () async {
                 
                   if(_formkey.currentState!.validate()){
                     var response = await authService.signIn(username, password);
                     if(response == "User found"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                     }
                     else if(response == "User not found"){
                      ToastContext().init(context);
                    Toast.show("User not found,Please register first");
                     }
                      else{
                      print("Error occured");
                     }
                   }
                   usercontroller.clear();
                   passcontroller.clear();
                }, child: Text("SignIn"),)
            ],
          ),
        ),
             Row(children: [Text('Dont have an account?'),TextButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUppage()));
             }, child: Text('SignUp',style: TextStyle(color: Colors.pink),))],mainAxisAlignment: MainAxisAlignment.center,),
           Container(child :Image.asset('assests/name.png'),width:350,height: 350,)
           
          ],),
        ),
      ),
    );
  }
}