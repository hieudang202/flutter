import 'package:customerloyalty/models/bonus.dart';
import 'package:customerloyalty/promotion/Bonus_Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BonusPage extends StatelessWidget {
  final List<BonusBuy> lstbonus;
  final BonusBuy bonusbuy;
  BonusPage({this.lstbonus,this.bonusbuy});
  var formatter = new NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: const Text('Chương Trình Khuyến Mại',style: TextStyle(fontFamily: 'nunito_sans',fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: ListView.builder(
          itemCount: lstbonus.length,
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Bonus_Detail(bonusbuy: lstbonus[index],)));
              },
              child: ListTile(
                leading: Icon(
                  Icons.add_shopping_cart,
                  color: Theme.of(context).primaryColorLight,
                  size: 25,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Theme.of(context).primaryColorLight,
                  size: 25,
                ),
                title: Text(lstbonus[index].idBonus,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.w700,fontFamily: 'nunito_sans')
                ),
                subtitle: Transform.translate(
                  offset: Offset(0, 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((lstbonus[index].nameBonnus),overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15,fontFamily: 'nunito_sans'),textAlign: TextAlign.left),
                    ],),
                ),
              ),
            ));
          }),
    );
  }
}
