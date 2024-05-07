import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:life_duration/constants.dart';
import 'package:life_duration/result_page.dart';
import 'package:life_duration/user_data.dart';

import 'Icon_Text.dart';
import 'Kutu.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = '';
  double smoke = 0.0;
  double spor = 0;
  int height = 185;
  int weight = 93;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            'REMAINING LIFE',
            style: karamanStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'Height',
                              style: karamanStyle,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              height.toString(),
                              style: sayiStyle,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    height++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    height--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'Weight',
                              style: karamanStyle,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              weight.toString(),
                              style: sayiStyle,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Haftada kaç gün spor yapıyorsunuz ?',
                      style: karamanStyle,
                    ),
                    Text(
                      spor.round().toString(),
                      style: sayiStyle,
                    ),
                    Slider(
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: spor,
                        onChanged: (double newValue) {
                          setState(() {
                            spor = newValue;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Günde kaç adet sigara içiyorsunuz ?',
                      style: karamanStyle,
                    ),
                    Text(smoke.round().toString(),
                        //'${icilenSigara.round()}',
                        style: sayiStyle),
                    Slider(
                        min: 0,
                        max: 30,
                        value: smoke,
                        onChanged: (double newValue) {
                          setState(() {
                            smoke = newValue;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = 'KADIN';
                        });
                      },
                      renk: selectedGender == 'KADIN'
                          ? Colors.yellow
                          : Colors.white,
                      child: MyColumn(
                          Cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = 'ERKEK';
                        });
                      },
                      renk: selectedGender == 'ERKEK'
                          ? Colors.yellow
                          : Colors.white,
                      child: MyColumn(
                          icon: FontAwesomeIcons.mars, Cinsiyet: 'ERKEK'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                          kilo: weight,
                          boy: height,
                          seciliCinsiyet: selectedGender,
                          sporGunu: spor,
                          icilenSigara: smoke)),
                    ),
                  );
                },
                child: Text(
                  'HESAPLA',
                  style: karamanStyle,
                ),
              ),
            ), // Buton üzerinde görünecek metin
          ],
        ));
  }
}
