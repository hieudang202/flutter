import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget{
  Password({this.passCtrl});
  // Password({Key key,this.passCtrl}) : super(key: key);
  final TextEditingController passCtrl;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Mật khẩu",
          labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
          // hintText: S.of(context).f_password
        ),
        controller: passCtrl,
      ),
    );
  }

}