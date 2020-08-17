import 'dart:developer';

import 'package:extraextrovert/resources/services.dart';
import 'package:extraextrovert/resources/user_model.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Services services;

  @override
  void initState() {
    super.initState();
    services = new Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3376CD),
        body: Container(
          color: Color(0xff3376CD),
          child: FutureBuilder(
            future: services.getUser(),
            builder: (BuildContext context,
                AsyncSnapshot<List<UserModel>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      'Something wrong with messages: ${snapshot.error.toString()}'),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<UserModel> users = snapshot.data;
                return _buildListView(users);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  ListView _buildListView(List<UserModel> users) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: users.length != null ? users.length : 3,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  leading: Container(
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 3.0, color: Color(0xff3376CD)))),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text(
                          users[index].hasil == "ekstrovert" ? "E" : "I",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    users[index].nama,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Text(users[index].npm,
                      style: TextStyle(color: Colors.black87)),
                )),
          ),
        );
      },
    );
  }
}
