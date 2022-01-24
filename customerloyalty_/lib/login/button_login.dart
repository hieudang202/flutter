import 'package:customerloyalty/utils/hexa_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin({this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: HexColor("#17305b"))),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("ĐĂNG NHẬP",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                              fontFamily: 'nunito_sans',))
                      ],
                    )
                )
            )
        )
    );
  }
}
