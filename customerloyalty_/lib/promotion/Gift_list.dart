import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:customerloyalty/models/Gift.dart';
import 'package:customerloyalty/home/Gift_detail.dart';

class GiftList extends StatelessWidget {
  final List<gift> dsgift;

  GiftList({this.dsgift});
  TextEditingController _controller = TextEditingController();
  var formatter = new NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    _controller.text = 'Gift';
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
        title: const Text('Thẻ Quà Tặng',style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'nunito_sans')),
      ),
      body: ListView.builder(
          itemCount: dsgift.length,
          itemBuilder: (context, index) {
            return Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GiftDetail(InfoGift: dsgift[index],)));
                  },
                  child: ListTile(
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Theme
                          .of(context)
                          .primaryColorLight,
                      size: 25,
                    ),
                    leading: Icon(
                      Icons.card_giftcard,
                      color: Theme
                          .of(context)
                          .primaryColorLight,
                      size: 25,
                    ),
                    title: Text(dsgift[index].IdProduct,
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .primaryColorLight,
                        fontWeight: FontWeight.w500,),

                    ),
                    subtitle: Transform.translate(
                      offset: Offset(0, 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              (dsgift[index].Description),
                              overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,
                              // overflow: TextOverflow.fade,
                              // maxLines: 1,
                              // softWrap: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,)),
                        ],),
                    ),
                  ),
                ));
          }),
    );
  }
}
