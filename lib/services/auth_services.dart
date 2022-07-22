import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class authService{


static String baseurl = "https://ancient-scrubland-07381.herokuapp.com/";

 static Future<String> signUp(String username,String password) async {

    Uri requesturi = Uri.parse(baseurl+'signUp');
    var response = await http.post(requesturi,body: {"username":username,"password":password});
    return response.body;
  }
  
 static Future<String> signIn(String username,String password) async {
         Uri requesturi = Uri.parse(baseurl+'signIn');
    var response = await http.post(requesturi,body: {"username":username,"password":password});
    final userInf = await SharedPreferences.getInstance();
    userInf.setString('username', username);
    return response.body;  
  }

}