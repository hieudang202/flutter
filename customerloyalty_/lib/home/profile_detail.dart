import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:customerloyalty/models/customer.dart';
import 'package:customerloyalty/home/home.dart';
import 'package:customerloyalty/models/params.dart';
import 'Update_Password.dart';

class ProfileDetail extends StatelessWidget {
  final Customer customer;
  ProfileDetail({Key key, this.customer, }) : super(key: key);
  var formatter = new NumberFormat("#,###", "en_US");
  final _customeridController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _customerAddressController = TextEditingController();
  final _customerEmailController = TextEditingController();
  final _customerPhoneController = TextEditingController();
  final _updatePasswordController = TextEditingController();
  final _customerPasswordController = TextEditingController();



  @override

  Widget build(BuildContext context) {

    _customeridController.text = customer.id;
    _customerNameController.text = customer.name;
    _customerAddressController.text =
        "Số 12 ngõ 252 Định Công,Hoàng Mai, Hà Nội";
    _customerEmailController.text = customer.email;
    _customerPhoneController.text = customer.phone;
    _updatePasswordController.text = 'Đổi mật khẩu';
    _customerPasswordController.text = customer.u_Password;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1155153.jpg'), fit: BoxFit.cover),
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //       top: Radius.circular(10), bottom: Radius.circular(50)),
        // ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
            alignment: Alignment.topLeft,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        customer: customer,
                      )));
            },
          ),
        ],
        centerTitle: true,
        title: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 7),
                                        child: Text(customer.name.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                fontFamily: 'nunito_sans')),
                                      ),
                                      Container(
                                        child: Text(
                                            customer.level.toUpperCase() +
                                                '- ${formatter.format(customer.point)} điểm',
                                            style: TextStyle(
                                                color: Colors.white,
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
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              //flex: 3,
              //padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: BarCodeImage(
                    backgroundColor: Colors.white,
                    params: Code39BarCodeParams(
                        customer.id, //data.customer.customerCode,
                        lineWidth: 2.25,
                        barHeight: 70,
                        withText: false),
                    onError: (err) {
                      print('Barcode Error: ' + err);
                    },
                  ),
                ),
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                      // height: MediaQuery.of(context).size.height,
                      child: Column(
                    children: [
                      // Thông tin tài khoản
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Thông Tin Tài Khoản',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'Mã thành viên',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans',),
                            // hintText: S.of(context).f_username
                          ),
                          controller: _customeridController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: "Họ tên",
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans'),
                            // hintText: S.of(context).f_username
                          ),
                          controller: _customerNameController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: "Địa chỉ",
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans'),
                            // hintText: S.of(context).f_username
                          ),
                          controller: _customerAddressController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans'),
                            // hintText: S.of(context).f_username
                          ),
                          controller: _customerEmailController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: "Số điện thoại",
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans'),
                            // hintText: S.of(context).f_username
                          ),
                          controller: _customerPhoneController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 15, right: 8),
                        child: TextField(
                          readOnly: true ,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => UpdatePassword(
                                                  customer: customer,
                                             )));
                              },
                              icon: Icon(Icons.create_sharp,
                                  size: 20, color:Theme.of(context).primaryColorLight),
                            ),
                            // Icon(Icons.create_sharp,color: Colors.orange,),
                            contentPadding: EdgeInsets.zero,
                            labelText: "Mật Khẩu",
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 21,fontFamily: 'nunito_sans'),
                            // hintText: S.of(context).f_username
                          ),
                          controller:_customerPasswordController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'nunito_sans',),
                        ),
                      ),
                    ],
                  )),
                ),
              ])),
        ],
      ),
    ));
  }
}
