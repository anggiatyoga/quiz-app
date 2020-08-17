import 'package:extraextrovert/dashboard.dart';
import 'package:extraextrovert/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationHome extends StatefulWidget {
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerNpm = TextEditingController();

  String position = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3376CD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Wellcome"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.cloud_download),
              onPressed: () {
                //TODO export ke excel
                Fluttertoast.showToast(
                    msg: "Download berjalan",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              })
        ],
      ),
      body: DashboardScreen(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("UNJ2020"),
              accountEmail: Text("unj2020@gmail.com"),
              decoration: BoxDecoration(
                color: Color(0xff3376CD),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Show Data"),
              onTap: () {
                setState(() {
                  position = "Data";
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext cotext) => NavigationHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("Take QUIZ"),
              onTap: () {
                setState(() {
                  position = "Quiz";
                });

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Text(
                                      'ISI DATA DIRI',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _controllerNama,
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      decoration:
                                          InputDecoration(hintText: 'Nama'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _controllerNpm,
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      decoration:
                                          InputDecoration(hintText: 'Npm'),
                                    ),
                                  ),
                                  ButtonTheme(
                                    minWidth: double.infinity,
                                    child: RaisedButton(
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.blue)),
                                      child: Text("SUBMIT"),
                                      onPressed: () {
                                        String getNama = _controllerNama
                                            .value.text
                                            .toString();
                                        String getNpm = _controllerNpm
                                            .value.text
                                            .toString();
                                        print(
                                            "getNama : $getNama getNpm : $getNpm");
                                        if (getNama != "" && getNpm != "") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext cotext) =>
                                                          Home(
                                                              nama: getNama,
                                                              npm: getNpm)));
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Mohon isi data",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
