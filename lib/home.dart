import 'package:extraextrovert/hasil.dart';
import 'package:extraextrovert/jawaban.dart';
import 'package:extraextrovert/kuis.dart';
import 'package:extraextrovert/pertanyaan.dart';
import 'package:extraextrovert/resources/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  String nama;
  String npm;
  Home({this.nama, this.npm});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var _pertanyaanIndex = 0;
  double _totalInt = 0;
  double _totalEks = 0;
  double _totalScore = 0;
  void _klikJawaban(int score, String i) {
    if (i == 'int') {
      _totalInt += score;
    }
    if (i == 'eks') {
      _totalEks += score;
    }
    _totalInt = _totalInt;
    _totalEks = _totalEks;
    _totalScore = _totalEks - _totalInt;
    print('total score');
    setState(() {
      _pertanyaanIndex++;
    });
    print(_totalInt);
    print(_totalEks);
    print(_totalScore);
  }

  void CobaLagi() {
    setState(() {
      _pertanyaanIndex = 0;
      _totalInt = 0;
      _totalEks = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _pertanyaan = [
      {
        'teksPertanyaan':
            'Apabila akan jalan/nongkrong, biasanya saya yang menentukan tempatnya',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya lebih sering bertindak langsung/spontan tanpa berpikir panjang terlebih dahulu',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya biasanya dapat menyembunyikan ekspresi marah atau kecewa pada saat berada di sekitar teman-teman saya',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya mengagumi salah satu artis yang diidolakan sejak kecil sampai sekarang',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya hanya bertindak sesuai apa yang saya percaya/yakini',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya lebih baik introspeksi diri apabila tidak mendapat peringkat pertama daripada menyalahkan orang lain',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya lebih baik berpikir panjang terlebih dahulu,baru bertindak',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya selalu mencari kesibukan dan tidak bisa tinggal diam',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Cukup mudah bagi saya untuk mengatakan ya atau tidak pada saat menentukan pilihan',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan': 'Saya sangat menyukai kompetisi/persaingan',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya suka mempertahankan argumen/pendapat sampai titik darah penghabisan',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya lebih sering memendam apa pun yang saya rasakan',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya lebih suka mempertahankan style saya daripada mengikuti trend yang sedang populer',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      },
      {
        'teksPertanyaan':
            'Saya merasa nyaman meskipun dengan teman yang baru dikenal',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Mimik wajah dan perkataan saya biasanya menunjukan kondisi emosional saya',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Menurut teman, saya merupakan orang yang keras kepala',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'eks'},
          {'text': 'setuju', 'score': 3, 'i': 'eks'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'eks'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'eks'}
        ]
      },
      {
        'teksPertanyaan':
            'Walaupun saya sedang mengerjakan sesuatu, saya tidak bisa menolak apabila ada teman meminta bantuan',
        'teksJawaban': [
          {'text': 'sangat setuju', 'score': 4, 'i': 'int'},
          {'text': 'setuju', 'score': 3, 'i': 'int'},
          {'text': 'tidak setuju', 'score': 2, 'i': 'int'},
          {'text': 'sangat tidak setuju', 'score': 1, 'i': 'int'}
        ]
      }
    ];

    return Scaffold(
      body: _pertanyaanIndex < _pertanyaan.length
          ? Kuis(
              klikJawaban: _klikJawaban,
              pertanyaan: _pertanyaan,
              pertanyaanIndex: _pertanyaanIndex,
            )
          : Hasil(_totalScore.toInt(), CobaLagi, widget.nama, widget.npm),
    );
  }
}
