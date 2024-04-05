import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: Text(
            'Karamanba Restorant',
            style: GoogleFonts.bilboSwashCaps(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = Random().nextInt(5) + 1;

  int yemekNo = Random().nextInt(5) + 1;

  int tatliNo = Random().nextInt(5) + 1;

  void button() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      print('corbaNo : $corbaNo');
    });
  }

  void button2() {
    setState(() {
      yemekNo = Random().nextInt(5) + 1;
      print('yemekNo : $yemekNo');
    });
  }

  void button3() {
    setState(() {
      tatliNo = Random().nextInt(5) + 1;
      print('tatliNo : $tatliNo');
    });
  }

  List<String> corbaAdlari = [
    'Mercimek Corbasi',
    'Tarhana Corbasi',
    'Tavuk Suyu Corbasi',
    'Dügün Corbasi',
    'Yogurt Corbasi',
  ];

  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'Içli Kofte',
    'Izgara Balık',
  ];

  List<String> tatliAdlari = [
    'Kadayif',
    'Baklava',
    'Sütlac',
    'Kazandibi',
    'Dondurma',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  button();
                },
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNo - 1],
            style: GoogleFonts.barlowCondensed(fontSize: 25),
          ),
          Container(
            width: 250,
            child: Divider(
              height: 5,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                  onPressed: () {
                    button2();
                  },
                  child: Image.asset('assets/images/yemek_$yemekNo.jpg')),
            ),
          ),
          Text(
            yemekAdlari[yemekNo - 1],
            style: GoogleFonts.barlowCondensed(fontSize: 25),
          ),
          Container(
            width: 250,
            child: Divider(
              height: 5,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                  onPressed: () {
                    button3();
                  },
                  child: Image.asset('assets/images/tatli_$tatliNo.jpg')),
            ),
          ),
          Text(
            tatliAdlari[tatliNo - 1],
            style: GoogleFonts.barlowCondensed(fontSize: 25),
          ),
          Container(
            width: 250,
            child: Divider(
              height: 15,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

























////////////////////////////////////////
Card(
margin: EdgeInsets.symmetric(
horizontal: 30,
),
color: Colors.white,
child: TextButton(
onPressed: () {
button();
},
child: Row(
children: [
Icon(
Icons.favorite,
size: 20,
color: Colors.red,
),
SizedBox(
width: 15,
),
Text(
'AŞK',
style: GoogleFonts.adventPro(
color: Colors.black, fontSize: 25),
)
