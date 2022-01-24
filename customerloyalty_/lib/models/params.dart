import 'package:flutter/cupertino.dart';

class User{
  String phone;
  String password;

  get getPhone{
    return phone;
  }
  set setPhone(String _phone){
    this.phone = _phone;
  }
  get getPassword{
    return password;
  }
  set setPassword(String _password){
    this.password = _password;
  }
}
class ChangePassword{
  String LoyId;
  String ConfimPass;

  get getloyid{
    return LoyId;
  }
  set setloyid(String _loyid){
    this.LoyId = _loyid;
  }
  get getConfimPass{
    return ConfimPass;
  }
  set setConfimPass(String _confimpass){
    this.ConfimPass = _confimpass;
  }
}