import 'package:extraextrovert/navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:extraextrovert/jawaban.dart';
import 'package:extraextrovert/pertanyaan.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'jawaban.dart';

class Kuis extends StatelessWidget {
  final List<Map<String, Object>> pertanyaan;
  final int pertanyaanIndex;
  final Function klikJawaban;

  Kuis(
      {@required this.pertanyaan,
      @required this.pertanyaanIndex,
      @required this.klikJawaban});
  @override
  Widget build(BuildContext context) {
    double indexPertanyaanPersen = pertanyaanIndex / pertanyaan.length;
    double heightSizeLayout = MediaQuery.of(context).size.height * 0.025;
    return Container(
      color: Color(0xff3376CD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
            width: 50,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xffF8A736),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext cotext) => NavigationHome()));
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, heightSizeLayout, 30, 0),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Pertanyaan $pertanyaanIndex /',
                          style:
                              TextStyle(fontSize: 25.0, color: Colors.white70),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${pertanyaan.length}',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white54),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: new LinearPercentIndicator(
                    lineHeight: 10.0,
                    percent: indexPertanyaanPersen,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xffF8A736),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Pertanyaan(
                            pertanyaan[pertanyaanIndex]['teksPertanyaan']),
                        ...(pertanyaan[pertanyaanIndex]['teksJawaban']
                                as List<Map<String, Object>>)
                            .map((teksJawaban) {
                          return Jawaban(
                              () => klikJawaban(
                                  teksJawaban['score'], teksJawaban['i']),
                              teksJawaban['text']);
                        }).toList(),
                      ]),
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
