import 'package:coursify_app/models/friend.dart';
import 'package:coursify_app/widget.dart/friendtile.dart';
import 'package:flutter/material.dart';

class LeaderProvider with ChangeNotifier{


List<friend> friends = [];

void addFriend(friend newFriend){
  friends.add(newFriend);
  notifyListeners();
}



}