import 'package:customerloyalty/login/login_screen.dart';
import 'package:customerloyalty/utils/hexa_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor('#11f136'),//backgroud
        primaryColorLight: HexColor('#0ac92a'),// icon
      ),
      home: Login()
    );
  }
}


