import 'dart:ui';
import 'package:customerloyalty/models/bonus.dart';
import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:customerloyalty/models/customer.dart';
import 'package:customerloyalty/home/home.dart';
import 'package:marquee/marquee.dart';

class Bonus_Detail extends StatelessWidget {
  final BonusBuy bonusbuy;
  Bonus_Detail({Key key, this.bonusbuy, List<BonusBuy> lstbonus})
      : super(key: key);
  var formatter = new NumberFormat("#,###", "en_US");
  final _bonusbuyidController = TextEditingController();
  final _bonusbuyNameController = TextEditingController();
  final _bonusbuystartDateController = TextEditingController();
  final _bonusbuyendDateController = TextEditingController();
  final _bonusbuystartTimeController = TextEditingController();
  final _bonusbuyendTimeController = TextEditingController();
  final _bonusbuydiscountPercentController = TextEditingController();
  final _bonusbuynameStoreController = TextEditingController();
  final _bonusbuynameStoreGroupController = TextEditingController();
  final _bonusbuynameLoyatyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _bonusbuyidController.text = bonusbuy.idBonus;
    _bonusbuyNameController.text = bonusbuy.nameBonnus;
    _bonusbuystartDateController.text = bonusbuy.startDate;
    _bonusbuyendDateController.text = bonusbuy.endDate;
    _bonusbuystartTimeController.text = bonusbuy.startTime;
    _bonusbuyendTimeController.text = bonusbuy.endTime;
    _bonusbuydiscountPercentController.text = bonusbuy.discountPercent ;
    _bonusbuynameStoreController.text = bonusbuy.nameStore;
    _bonusbuynameStoreGroupController.text = bonusbuy.nameStoreGroup;
    _bonusbuynameLoyatyController.text = bonusbuy.nameLoyaty;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRRect(

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1155153.jpg'), fit: BoxFit.fill),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Chi Tiết Khuyến Mãi",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'nunito_sans'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Mã Bonus',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuyidController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Mô Tả',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    minLines: 1,
                    maxLines: 3,
                    controller: _bonusbuyNameController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Ngày Bắt Đầu',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuystartDateController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Ngày Kết Thúc',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuyendDateController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Thời Gian Bắt Đầu',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuystartTimeController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Thời Gian Kết Thúc',
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuyendTimeController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "Giảm Giá",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuydiscountPercentController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "Cửa Hàng Áp Dụng",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuynameStoreController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "Nhóm Cửa Hàng Áp Dụng",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuynameStoreGroupController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "Loại Thẻ KHTT Áp Dụng",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,fontFamily: 'nunito_sans'),
                      // hintText: S.of(context).f_username
                    ),
                    controller: _bonusbuynameLoyatyController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'nunito_sans'),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
