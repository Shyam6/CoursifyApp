import 'package:coursify_app/models/friend.dart';
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

static Future<String> getFriendDets(String friendname) async {

    Uri requesturi = Uri.parse(baseurl+'friendDetails?query='+ friendname);
    var response = await http.get(requesturi);
    return response.body;
  }

static Future<String> addFriend(String friendname,String myname) async {

    Uri requesturi = Uri.parse(baseurl+'addUser?query='+ friendname);
    var response = await http.post(requesturi,body: {"username":myname});
    return response.body;
  }

  static Future<List<dynamic>> friendNames() async {
    var prefs = await SharedPreferences.getInstance();
     var myname = prefs.getString('username').toString();
    Uri requesturi = Uri.parse(baseurl+'friendnames?query='+ myname);
    var response = await http.get(requesturi);
    //print(json.decode(response.body).runtimeType);
    return json.decode(response.body);
  }


  static Future<String>  setCoursesFinished() async {
      var prefs = await SharedPreferences.getInstance();
     var myname = prefs.getString('username').toString();
    Uri requesturi = Uri.parse(baseurl+'course/updatecourses?query='+ myname);
    var response = await http.post(requesturi,body: {"coursesfinished":"1"});
    //print(json.decode(response.body).runtimeType);
    return response.body;
  }
}