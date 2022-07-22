import 'package:coursify_app/screens/home.dart';
import 'package:coursify_app/screens/signIn.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class SignUppage extends StatefulWidget {
  const SignUppage({ Key? key }) : super(key: key);

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
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
                decoration: InputDecoration(hintText: "Enter a Username"),
                validator: (val) => val!.isEmpty ?"Enter a Username":null,
                onChanged: (val){
                     username = val;
                },
              )),
              SizedBox(height: 20.0),
             Container( width: 350,child:TextFormField(
             decoration : InputDecoration(hintText: "Enter a password"),
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
                       var response = await authService.signUp(username, password);
                        if(response == "User registered"){
                          ToastContext().init(context);
                    Toast.show(response);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Namepage()));
                     }
                     else if(response == "User is already registered,if new user try another username"){
                      ToastContext().init(context);
                    Toast.show(response);
                     }
                     else{
                      print("Error occured");
                      print(response);
                     }

                   }
                  usercontroller.clear();
                   passcontroller.clear();
                }, child: Text("SignUp"),)
            ],
          ),
        ),
             Row(children: [Text('Already have an account?'),TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Namepage()));
             }, child: Text('SignIn',style: TextStyle(color: Colors.pink),))],mainAxisAlignment: MainAxisAlignment.center,),
           Container(child :Image.asset('assests/name.png'),width:350,height: 350,)
           
          ],),
        ),
      ),
    );
  }
}