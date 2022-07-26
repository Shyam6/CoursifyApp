import 'dart:convert';
import 'package:coursify_app/models/course.dart';
import 'package:http/http.dart' as http;
class CourseApi {

 static String baseurl = "https://ancient-scrubland-07381.herokuapp.com/course";


 static Future<String> addCourse (Map<String,dynamic> map,String courseurl) async {
    Uri requesturi = Uri.parse(baseurl+'/add?query='+ courseurl);
   // print(requesturi);
   
    var response = await http.post(requesturi,body: map);
    return response.body;
   // print(response.body);
     //var decodedResponse = jsonDecode(response.body);
     //print(decodedResponse);
    
   
 } 
 static Future<Map<String,dynamic>> courseInfo (String id) async {
    Uri requesturi = Uri.parse(baseurl+'/list?query='+ id);
    var response = await http.get(requesturi);
    //convert json response to map
     var decodedResponse = jsonDecode(response.body);
     if(decodedResponse==null){
      return {};
     }
     return decodedResponse; 
   // print(response);
 } 
 static Future<String> deleteCourse (String id) async {
    Uri requesturi = Uri.parse(baseurl+'/delete');
    var response = await http.post(requesturi,body: {"id":id});
     return response.body;
   // print(response.body); 
 } 
 
 static Future<String> updateCourse (String id,Map<String,dynamic> map) async {
    Uri requesturi = Uri.parse(baseurl+'/update?query='+ id);
  // print(map.runtimeType);
    var response = await http.post(requesturi,body: map);
     return response.body;
    //print(response.body);  
 } 

  static Future<List<Course>> coursefetch (String name) async {
    Uri requesturi = Uri.parse(baseurl+'/fetch?query='+name);
    var response = await http.get(requesturi);
     var decodedResponse = jsonDecode(response.body);
     print(decodedResponse);
     List<Course> courses =[];
     
     for(var coursemap in decodedResponse){
      courses.add(Course.fromMap(coursemap));
     }
    return courses;
 } 

 

}