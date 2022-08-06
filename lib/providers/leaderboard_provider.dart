import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:coursify_app/widget.dart/friendtile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LeaderProvider with ChangeNotifier{


LeaderProvider()  {
  fetchLeaders();
}

List<friend> friends = [];
bool isLoading = true;
void addFriend(friend newFriend){
  friends.add(newFriend);
   friends.sort((b,a)=>a.coursesfinished.compareTo(b.coursesfinished));
   isLoading = false;
  notifyListeners();
}

Future<void> fetchLeaders() async {
    List<dynamic> allfriends = await authService.friendNames();
    if(allfriends!="Could not find the names due error"){
      for (var f in allfriends){
        int cf;
        var coursesfinished = await authService.getFriendDets(f);
        if(coursesfinished!="Could not find the details due error"){
         cf = int.parse(coursesfinished);
          friends.add(friend(name: f, coursesfinished: cf));
        }
        else{
          Toast.show("Could not find the details due error");
        }
      
      }
    }
    friends.sort((b,a)=>a.coursesfinished.compareTo(b.coursesfinished));
    isLoading = false;
    notifyListeners();
}

Future<void> updateCoursesfinished(int cf) async {
final prefs = await SharedPreferences.getInstance();
var myname = prefs.getString('username').toString();
  friends.removeWhere((element) => element.name==myname);
  addFriend(friend(name: myname, coursesfinished: cf));
}
notifyListeners();
}