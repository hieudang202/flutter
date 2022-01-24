import 'dart:convert';
import 'package:customerloyalty/models/bonus.dart';
import 'package:customerloyalty/models/params.dart';
import 'package:http/http.dart' as http;
import 'package:customerloyalty/models/customer.dart';
import 'package:customerloyalty/models/coupon.dart';
import 'dart:async';
import 'package:customerloyalty/models/Gift.dart';

class RESTClient{
  static final String API_URL = 'http://192.168.1.9:8081/';
  RESTClient._privateConstructor();
  static final RESTClient instance = RESTClient._privateConstructor();

  Future<Customer> postLogin(User user) async {
    Customer customer;
    http.Response response = await http.post(Uri.encodeFull(API_URL + 'api/login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'UserName':user.phone,
          'Password':user.password,
        },);
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      if (obj['code'] == 200) {
        customer = Customer.fromJson(obj['data']);
        return customer;
      } else {
        throw Failure(obj['message']);
      }
    }else{
      throw Failure('Network Error!');
    }
  }
  Future<List<BonusBuy>> getbonus() async {
    List<BonusBuy> bonus;
    http.Response response = await http.get(Uri.encodeFull(API_URL + 'api/bonus'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },);
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      if (obj['code'] == 200) {
        bonus = (obj['data'] as List).map((data) => BonusBuy.fromJson(data)).toList();
        return bonus;
      } else {
        throw Failure(obj['message']);
      }
    }else{
      throw Failure('Network Error!');
    }
  }
  Future<DsGift> getGift(Customer customer) async{
    DsGift dsGift;
    http.Response response = await http.get(Uri.encodeFull(API_URL + 'api/gift'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'LoyId': customer.loyaltyId
      },);
    if (response.statusCode == 200) {
      var obj = json.decode(response.body);
      if (obj['code'] == 200) {
        dsGift = DsGift.fromJson(obj['data']);
        return dsGift;
      }
      else{
        throw Failure(obj['message']);
      }
    }
    else{
      throw Failure('Network Error!');
    }
  }
  Future<Null> changePassword(ChangePassword changepwd) async{
    http.Response response = await http.post(Uri.encodeFull(API_URL + 'api/newpwd'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'loyalityid': changepwd.LoyId,
        'password': changepwd.ConfimPass
      },);
    if(response.statusCode != 200) {
      var obj = json.decode(response.body);
      throw Failure(obj['message']);
    }
  }
}


class Failure {
  final String message;
  Failure(this.message);
  @override
  String toString() => message;
}