import 'dart:convert';

import 'package:extraextrovert/dashboard.dart';
import 'package:extraextrovert/home.dart';
import 'package:extraextrovert/login.dart';
import 'package:extraextrovert/navigation_home.dart';
import 'package:extraextrovert/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Hasil extends StatefulWidget {
  final int _totalScore;
  final Function CobaLagi;
  final String nama;
  final String npm;
  Hasil(this._totalScore, this.CobaLagi, this.nama, this.npm);

  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerNpm = TextEditingController();
  var hasilteks;

  String get _hasilScore {
    if (widget._totalScore < 0) {
      hasilteks = 'introvert';
    } else {
      hasilteks = 'ekstrovert';
    }
    return hasilteks;
  }

  void submitData() async {
    String getNama = widget.nama.toString();
    String getNpm = widget.npm.toString();
    String getHasil = hasilteks;
    String messages;

    if (getNama.isNotEmpty && getNpm.isNotEmpty && getHasil.isNotEmpty) {
      final response = await http.post(
          "http://192.168.0.11/mysql_config/insert_user.php",
          body: {"nama": getNama, "npm": getNpm, "hasil": getHasil});
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext cotext) => NavigationHome()));
      if (response.statusCode == 200) {
        messages = 'Success';
      } else {
        messages = response.statusCode.toString();
      }
    } else {
      messages = 'mohon isi kolom yang kosong';
    }

    Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3376CD),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
            elevation: 10,
            child: ClipPath(
              child: Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage(_hasilScore == 'introvert'
                          ? 'images/intovert.png'
                          : 'images/extrovert.png'),
                      fit: BoxFit.contain,
                      repeat: ImageRepeat.noRepeat,
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                        'Anda tergolong',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                      child: Text(
                        _hasilScore,
                        style: TextStyle(fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 70, 50, 0),
            child: Row(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 80,
                  height: 50,
                  child: FlatButton(
                      color: Colors.white,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Coba Lagi',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: widget.CobaLagi),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: ButtonTheme(
                    minWidth: 130,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        submitData();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
