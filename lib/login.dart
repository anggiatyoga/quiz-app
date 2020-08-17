import 'package:extraextrovert/dashboard.dart';
import 'package:extraextrovert/home.dart';
import 'package:extraextrovert/navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                    height: 200,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff3D76F7),
                            Color(0xff4F8BF8),
                            Color(0xff6DAEF9)
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 100, 0, 20),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        print(_nameController.text);
                        print(_passwordController.text);
                        if (_nameController.text == "admin" &&
                            _passwordController.text == "unj2020") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext cotext) =>
                                      NavigationHome()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Username atau password salah",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                    ))
              ],
            )));
  }
}
