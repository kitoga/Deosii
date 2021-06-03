import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Stats extends StatefulWidget {
  Stats({Key? key}) : super(key: key);

  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       child: Center(
         child: Text('stats page'),
       ),
    );
  }
}