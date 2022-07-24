import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/services/auth_services.dart';
import 'package:coursify_app/widget.dart/friendtile.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LeaderProvider with ChangeNotifier{

LeaderProvider(){
  fetchLeaders();
}

List<friend> friends = [];

void addFriend(friend newFriend){
  friends.add(newFriend);
  notifyListeners();
}

Future<void> fetchLeaders() async {
    List<String> allfriends = await authService.friendNames();
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
}


}