import 'package:flutter/material.dart';
import 'package:life_duration/constants.dart';
import 'package:life_duration/user_data.dart';

import 'calculation.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Life expectancy : ${Calculation(_userData).calculate().round().toString()}',
                style: karamanStyle.copyWith(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'BACK',
                style: karamanStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
