import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customerloyalty/models/customer.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BarcodeCard extends StatelessWidget {
  final Customer customer;
  BarcodeCard({Key key, this.customer}) : super(key: key);
  var formatter = new NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.highlight_off_outlined, size: 40),
                color: Colors.black87,
                padding: EdgeInsets.only(top: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Card(
              margin: EdgeInsets.only(top: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/card.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                        heightFactor: 1.5,
                        child: Text(
                          "", //customer.level
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'nunito_sans'),
                        )),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      height: 120,
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: BarCodeImage(
                        backgroundColor: Colors.white,
                        params: Code39BarCodeParams(
                            customer.id, //data.customer.customerCode,
                            lineWidth: 2.6,
                            barHeight: 80,
                            withText: true),
                        onError: (err) {
                          print('Barcode Error: ' + err);
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 3, right: 3),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "", //'Tiền: ${formatter.format(customer.currency)}đ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  fontFamily: 'nunito_sans',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "", //'Điểm: ${formatter.format(customer.point)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  fontFamily: 'nunito_sans',
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
