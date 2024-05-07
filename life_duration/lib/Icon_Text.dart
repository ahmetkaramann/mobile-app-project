import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class MyColumn extends StatelessWidget {
  final IconData icon;
  final String Cinsiyet;
  MyColumn(
      {this.icon = FontAwesomeIcons.accessibleIcon, this.Cinsiyet = 'default'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(height: 10),
        Text(
          Cinsiyet,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
