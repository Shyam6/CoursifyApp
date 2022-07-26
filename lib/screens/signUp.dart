import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/screens/home.dart';
import 'package:coursify_app/screens/signIn.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
import 'package:coursify_app/providers/leaderboard_provider.dart';
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

    LeaderProvider leadprov = Provider.of<LeaderProvider>(context);
    ToastContext().init(context);
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
                           int cf ;
                      var res = await authService.addFriend(username,username);
                      if(res=="user added"){
                        var coursesfinished = await authService.getFriendDets(username);
                        if(coursesfinished!="Could not find the details due error"){
                           cf = int.parse(coursesfinished);
                          
                            Toast.show(res);
                        }
                        else{
                          Toast.show("Couldnot add user to leaderboard");
                        }
                      }
                      else{   
                    Toast.show("Couldnot add user to leaderboard");}
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