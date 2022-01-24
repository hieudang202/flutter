import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  UserName({this.userCtrl});
  final TextEditingController userCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(

        decoration: InputDecoration(
          hintText: "Số điện thoại",
          labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
          // hintText: S.of(context).f_username
        ),
        controller: userCtrl,
      ),
    );
  }
  
}