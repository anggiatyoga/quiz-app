import 'package:flutter/material.dart';

class Pertanyaan extends StatelessWidget {
  final String teksPertanyaan;
  Pertanyaan(this.teksPertanyaan);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: <Widget>[
          Text(
            teksPertanyaan,
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff31547C),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
