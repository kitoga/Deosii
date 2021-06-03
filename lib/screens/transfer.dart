import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Transfer extends StatefulWidget {
  Transfer({Key? key}) : super(key: key);

  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       child: Center(
         child: Text('Transfer page'),
       ),
    );
  }
}