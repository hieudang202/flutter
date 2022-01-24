
import 'package:customerloyalty/models/transaction.dart';

class Customer{
  final String id;
  final String loyaltyId;
  final String name;
  final String phone;
  final String email;
  final double point;
  final double currency;
  final String level;
  final String u_Password;
  final List<Transaction> transactions;

  Customer.fromJson(Map json):
      id = json["Id"],
      name = json["FirstName"],
      loyaltyId = json["LoyaltyId"],
      phone = json["Phone"],
      email = json["Email"],
      point = json["Point"],
      currency = json["Currency"],
      level = json["Level"],
      u_Password = json["U_Password"],
      transactions = (json['Transactions'] as List).map((trans) => Transaction.fromJson(trans)).toList();

}