import 'dart:ui';
import 'package:customerloyalty/home/Barcode_card.dart';
import 'package:customerloyalty/home/profile.dart';
import 'package:customerloyalty/models/customer.dart';
import 'package:customerloyalty/models/bonus.dart';
import 'package:customerloyalty/promotion/Bonus_Page.dart';
import 'package:customerloyalty/promotion/Gift_list.dart';
import 'package:customerloyalty/transaction/transaction_list.dart';
import 'package:customerloyalty/utils/hexa_color.dart';
import 'package:customerloyalty/utils/rest_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:customerloyalty/home/profile_detail.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatelessWidget {
  final Customer customer;
  final BonusBuy bonus;
  const HomeScreen({Key key, this.customer, this.bonus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1155153.jpg'), fit: BoxFit.fill),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50)),
        ),
        backgroundColor:  HexColor('#ffffff'),
        centerTitle: true,
        title: Profile(customer: customer),
        toolbarHeight: 80,
        automaticallyImplyLeading: false, //show icon return
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),

        child: Container(
          margin: EdgeInsets.only(top:5,left: 5, right: 5),
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                decoration: new BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(15)),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/1155153.jpg'),

                    )
                ),
                padding: EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                child: ImageSlideshow(

                  width: double.infinity,
                  height: 250,
                  initialPage: 0, //bat dau chay tu anh thu 0
                  children: [
                    Image.asset('images/banner6.png', fit: BoxFit.cover),
                    Image.asset('images/banner7.jpg', fit: BoxFit.cover),
                    Image.asset('images/banne.jpg', fit: BoxFit.cover)
                  ],
                  autoPlayInterval: 5000,
                ),
              ),
              Container(
                child: Column(children: [
                  // Row 01
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print('Show chi tiết');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 3, right: 20),
                                child: Image.asset(
                                  'images/thongbao.png',
                                  width: 125,
                                  height: 70,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Thông Báo',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito_sans'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            RESTClient.instance.getbonus().then((bonus) => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BonusPage(
                                            lstbonus: bonus,
                                          ))),
                                });
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BonusDetail(listbonus: [bonus],)));
                            // show chi tết
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Image.asset('images/sale.png',
                                    width: 125,
                                    height: 70,
                                    ),
                              ),
                              Container(
                                child: Text(
                                  'Khuyến Mại',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'nunito_sans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row 02
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //quà tặng
                        InkWell(
                          onTap: () {
                            RESTClient.instance.getGift(customer).then((Gift) =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => GiftList(dsgift: Gift.Gift)
                                )
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 3,right: 20),
                                child: Image.asset('images/promotion.png',
                                  width: 125,
                                  height: 70,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Quà Tặng',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito_sans'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //lịch sử
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransactionList(
                                    transactions: customer.transactions)));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 3,),
                                child: Image.asset(
                                  'images/time.png',
                                  width: 125,
                                  height: 70,
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Lịch sử',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito_sans'),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.qr_code_scanner, title: 'QR'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 1, //optional, default as 0
        onTap: (int i) {
          switch (i) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        customer: customer,
                      )));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BarcodeCard(customer: customer)));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileDetail(
                        customer: customer,
                      )));
              break;
          }
        },
        activeColor: Theme.of(context).primaryColor,
        backgroundColor: HexColor('#FFFFFF'),
        color: HexColor('#0ac92a'),
      ),
    );
  }
}
