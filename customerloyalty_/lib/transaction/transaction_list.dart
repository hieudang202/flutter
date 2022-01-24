import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customerloyalty/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});
  var formatter = new NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    this.transactions.sort((trx1, trx2) => trx2.date.compareTo(trx1.date));
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
        title: const Text('Lịch sử giao dịch', style: TextStyle(color: Colors.white,fontFamily: 'nunito_sans',fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
                child: GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ndPage(1)));
              },
              child: ListTile(
                leading: Icon(
                  Icons.my_library_books_rounded,
                  color: Theme.of(context).primaryColorLight,
                  size: 25,
                ),
                title: Text(
                  transactions[index].transId,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Transform.translate(
                  offset: Offset(0, 7),
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.access_alarm),
                      ),
                      Text(
                          ' ' +
                              DateFormat('dd-MM-yyyy')
                                  .format(transactions[index].date),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Text('Tổng tiền: '),
                      Text('${formatter.format(transactions[index].total)} đ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                ),
              ),
            ));
          }),

      /*body: SafeArea(
        minimum: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
              Container(
                height: 600,
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              transactions[index].transId,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Transform.translate(
                                offset: Offset(0, 7),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.access_alarm),
                                    ),
                                    Text(' ' + DateFormat('dd-MM-yyyy').format(transactions[index].date),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                    Padding(padding: EdgeInsets.only(left: 30)),
                                    Text('Tổng tiền: '),
                                    Text('${formatter.format(transactions[index].total)} đ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
                                  ],
                                ),
                                ),
                            leading: Icon(
                              Icons.my_library_books_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 25,
                            ),
                          ),
                          Divider(color: Theme.of(context).primaryColor),
                        ],
                      );
                    },
                ),
              )
            ],
          ),
        ),
      ),*/
    );
  }
}
