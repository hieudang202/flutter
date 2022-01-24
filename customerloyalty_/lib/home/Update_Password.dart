import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:intl/intl.dart';
import 'package:customerloyalty/utils/rest_client.dart';
import 'package:customerloyalty/models/params.dart';
import 'package:customerloyalty/login/login_screen.dart';
import 'package:customerloyalty/models/customer.dart';
import 'home.dart';

class UpdatePassword extends StatelessWidget {
  final Customer customer;
  final RegExp MyPass = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$');
  UpdatePassword({Key key, this.customer}) : super(key: key);
  TextEditingController Pass = new TextEditingController();
  TextEditingController newPass = new TextEditingController();
  TextEditingController confim = TextEditingController();
  var formatter = new NumberFormat("#,###", "en_US");
  @override
  _showAlertDialog(BuildContext context, String mess, bool check,) {
    // set up the button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: Text(
          "OK",
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
        if (check) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      contentPadding: EdgeInsets.only(left: 5),
      title: Row(
        children: [

          // Icon(Icons.warning, color: Colors.yellow,),
          SizedBox(
            width: 15,
          ),
          Text(
            "Thông báo",
            style: TextStyle(fontSize: 25,),
          )
        ],
      ),
      //title: Text("Thông báo",style: TextStyle(fontSize: 25),),
      content: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      mess,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(
                  child: okButton,
                ),
                Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ],
            ),
          ),



        ],
      ),
      // actions: [
      //   okButton,
      // ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_sharp,
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
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Text(
              'Đổi Mật Khẩu',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'nunito_sans'),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: PasswordField(
              inputStyle: TextStyle(fontSize: 16, fontFamily: 'nunito_sans'),
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 18,
              ),
              maxLength: 12,
              hintText: 'Mật khẩu cũ *',
              textPadding: EdgeInsets.symmetric(horizontal: 18),
              controller: Pass,
              // ignore: deprecated_member_use
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: PasswordField(
              inputStyle: TextStyle(fontSize: 16, fontFamily: 'nunito_sans'),
              pattern: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$',
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 18,
              ),
              maxLength: 12,
              hintText: 'Mật khẩu mới *',
              textPadding: EdgeInsets.symmetric(horizontal: 18),
              errorMessage: 'Mật khẩu 5 ký tự gồm cả chữ và số',
              controller: newPass,
              // ignore: deprecated_member_use
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: PasswordField(
              inputStyle: TextStyle(fontSize: 16, fontFamily: 'nunito_sans'),
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 18,
              ),
              hintText: 'Nhập lại mật khẩu *',
              textPadding: EdgeInsets.symmetric(horizontal: 20),
              controller: confim,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child:RaisedButton(

                    child: Text(
                      'Xác Nhận',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'nunito_sans',
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: Theme.of(context).primaryColorLight,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12),
                    splashColor: Colors.lime[50],
                    onPressed: () {
                      if (MyPass.hasMatch(newPass.text) == false)
                        return _showAlertDialog(
                          context,
                          'Yêu cầu ít nhất là 5 ký tự có cả chữ và số',
                          false,
                          // Icon(Icons.warning, color: Colors.yellow)
                        );
                      else if (Pass.text != customer.u_Password) {
                        return _showAlertDialog(context, 'Mật khâu cũ không chính xác', false,
                          // Icon(Icons.warning, color: Colors.yellow)
                        );
                      } else if (newPass.text != confim.text) {
                        return _showAlertDialog(context, 'Mật khẩu mới không hợp lệ hoặc mật khẩu bị trống', false,
                          // Icon(Icons.warning, color: Colors.yellow)
                        );
                      };
                      ChangePassword changepwd = new ChangePassword();
                      changepwd.setloyid = customer.loyaltyId;
                      changepwd.setConfimPass = confim.text;
                      RESTClient.instance
                          .changePassword(changepwd)
                          .then((value) => {
                        _showAlertDialog(
                          context,
                          'Đổi mật khẩu thành công',
                          true,
                          // Icon(Icons.check, color: Colors.lightGreen)
                        ),
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        //     Login()
                        // ))
                      })
                          .catchError((onError) => {
                        print(onError),
                        _showAlertDialog(context, onError, false,
                          // Icon(Icons.warning, color: Colors.yellow)
                        ),
                        Navigator.pop(context)
                      });
                    },
                  ),),
                  // ignore: deprecated_member_use

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
