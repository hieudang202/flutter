import 'dart:ui';

import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:customerloyalty/promotion/Gift_list.dart';
import 'package:customerloyalty/models/Gift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GiftDetail extends StatelessWidget {
  final gift InfoGift;
  GiftDetail({Key key, this.InfoGift}) : super(key: key);
  TextEditingController _IdGroupProduct = TextEditingController();
  TextEditingController _DescriptionProductGroup = TextEditingController();
  TextEditingController _IdProduct = TextEditingController();
  TextEditingController _Description = TextEditingController();
  TextEditingController _UPC = TextEditingController();
  TextEditingController _Status = TextEditingController();
  TextEditingController _DefaultExpiryPeriod = TextEditingController();
  TextEditingController _Total = TextEditingController();
  var formatter = new NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    _Description.text = InfoGift.Description;
    _DescriptionProductGroup.text = InfoGift.DescriptionProductGroup;
    _IdGroupProduct.text = InfoGift.IdGroupProduct;
    _IdProduct.text = InfoGift.IdProduct;
    _Status.text = InfoGift.Status;
    _UPC.text = InfoGift.UPC;
    _DefaultExpiryPeriod.text = InfoGift.DefaultExpiryPeriod.toString();
    _Total.text = (InfoGift.Total.toInt()).toString() + ' đ';
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/1155153.jpg'), fit: BoxFit.fill),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
              alignment: Alignment.topLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          centerTitle: true,
          title: Text(
            'Chi Tiết quà tặng',
            style: TextStyle(
              fontSize: 20,color: Colors.white,fontFamily: 'nunito_sans',fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Row(crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(children: [
                Column(children: [
                  SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15, right: 8, top: 30),
                          child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Mã quà tặng',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,fontFamily: 'nunito_sans'),
                                // hintText: S.of(context).f_username
                              ),
                              controller: _IdProduct,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans')),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: 10, bottom: 15, right: 8),
                          child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Mô tả quà tặng',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,fontFamily: 'nunito_sans'),
                                // hintText: S.of(context).f_username
                              ),
                              controller: _Description,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans')),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: 10, bottom: 15, right: 8),
                          child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Mã UPC',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,fontFamily: 'nunito_sans'),
                                // hintText: S.of(context).f_username
                              ),
                              controller: _UPC,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans')),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: 10, bottom: 15, right: 8),
                          child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Tổng',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,fontFamily: 'nunito_sans'),
                                // hintText: S.of(context).f_username
                              ),
                              controller: _Total,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans')),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: 10, bottom: 15, right: 8),
                          child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Mã nhóm sản phẩm được áp dụng',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,fontFamily: 'nunito_sans'),
                                // hintText: S.of(context).f_username
                              ),
                              controller: _IdGroupProduct,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans')),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ])),
            ]));
  }
}
