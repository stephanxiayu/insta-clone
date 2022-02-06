import 'package:flutter/cupertino.dart';
import 'package:instaclone/model/user.dart';

import 'package:flutter/material.dart';
import 'package:instaclone/resurces/auth_methode.dart';
class UserProvider with ChangeNotifier{

User? _user;
final AuthMethode _authMethode= AuthMethode();



User get getUser => _user!;

Future<void>refreshUser()async{
  User user=await _authMethode.getUserDetails();
  _user=user;
  notifyListeners();



}

}