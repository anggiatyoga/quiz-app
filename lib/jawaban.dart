import 'package:flutter/material.dart';

class Jawaban extends StatelessWidget {
  final Function pilihJawaban;
  final String teksJawab;
  Jawaban(this.pilihJawaban, this.teksJawab);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xff4D4D52), width: 1)),
        child: RaisedButton(
          textColor: Color(0xff4D4D52),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              teksJawab,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          onPressed: pilihJawaban,
        ),
      ),
    );
  }
}
