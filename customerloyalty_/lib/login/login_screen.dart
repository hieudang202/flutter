
import 'dart:convert';

import 'package:customerloyalty/home/home.dart';
import 'package:customerloyalty/login/button_login.dart';
import 'package:customerloyalty/login/password.dart';
import 'package:customerloyalty/login/user_name.dart';
import 'package:customerloyalty/models/params.dart';
import 'package:customerloyalty/utils/rest_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget{
  @override
  _LoginScreen createState() => _LoginScreen();
}
class _LoginScreen extends State<Login>{
  final userCtl = TextEditingController();
  final passCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backimage.jpg"),
                fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30, bottom: 30,left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
                margin: EdgeInsets.only(top: 10, bottom: 30),
                alignment: Alignment.topCenter,
                child: Image.asset("images/logoFTI.png",
                    fit: BoxFit.contain, width: 180),
              ),
              UserName(userCtrl: userCtl),
              Password(passCtrl: passCtl),
              ButtonLogin(onPressed: onLogin)
            ],
          ),
        ),
      ),
    );
  }
  onLogin(){
    _showDialog(context);
     User user = new User();
     user.setPhone = userCtl.text;
     user.setPassword = passCtl.text;
     RESTClient.instance.postLogin(user).then((customer) => {
        print(customer.id),
        Navigator.pop(context),
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(customer: customer,)))
     }).catchError((error)=>{
       Navigator.pop(context),
        print(error)
     });
  }

  _showDialog(BuildContext context){
    AlertDialog alertDialog = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),
              child:Text('Đăng nhập....')
          ),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alertDialog;
      },
    );
  }
}