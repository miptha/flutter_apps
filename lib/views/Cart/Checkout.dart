import 'package:flutter/material.dart';
import 'package:flutter_apps/views/Login/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var loading = false, loadingDetail = false;

  String idUsers;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idUsers = preferences.getString("userid");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("code", null);
      preferences.setInt("level", null);
      preferences.commit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        padding: EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
        children: <Widget>[
          Center(
            child: Image.asset("assets/img/checklist.png"),
          ),
          Center(
            child: Text(
              "\nBerhasil Checkout!",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: RaisedButton(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              color: Colors.pink,
              child: Text(
                "Transaksi Baru",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      )),
    );
  }
}
