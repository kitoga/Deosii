import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Cards extends StatefulWidget {
  Cards({Key? key}) : super(key: key);

  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       child: Center(
         child: Text('Cards page'),
       ),
    );
  }
}