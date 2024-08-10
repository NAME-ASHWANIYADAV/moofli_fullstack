
import 'package:flutter/material.dart';

import 'package:moofli_fullstack/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    // id: '',
    // name: '',
    email: '',
    password: '',
    // address: '',
    // type: '',
    token: '',
    // cart: [],
  );

  
 List<Post> _diaryEntries = [];

  User get user => _user;
  List<Post> get diaryEntries => _diaryEntries;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void setDiaryEntries(List<Post> entries) {
    _diaryEntries = entries;
    notifyListeners();
  }
}


  

 
