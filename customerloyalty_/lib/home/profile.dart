import 'dart:ui';
import 'package:customerloyalty/utils/hexa_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customerloyalty/models/customer.dart';
import 'package:customerloyalty/home/profile_detail.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  final Customer customer;
  Profile({Key key, this.customer}) : super(key: key);
  var formatter = new NumberFormat("#,###","en_US");
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileDetail(customer: customer,)));
      },
      child: Container(
        //padding: EdgeInsets.only(bottom: 5),
        //margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  //color: Theme.of(context).primaryColor,
                  //padding: EdgeInsets.only(bottom: 5),
                  //margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                "images/ic_avatar.png",
                                fit: BoxFit.contain,
                                width: 60,
                                height: 60,
                                // color: HexColor('#ffffff'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: Text(
                                          customer.name.toUpperCase(),
                                          style: TextStyle(
                                              color: HexColor('#ffffff'),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              fontFamily: 'nunito_sans')),
                                    ),
                                    Container(
                                      child: Text(
                                          customer.level.toUpperCase() +
                                              '- ${formatter.format(customer.point)} điểm',
                                          style: TextStyle(
                                              color: HexColor('#ffffff'),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              fontFamily: 'nunito_sans')),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
