import 'dart:ui';
import 'package:ant_1/pages/top.dart';
import 'package:flutter/material.dart';

class Confirm extends StatefulWidget {
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  double _dot = 50.0;
  double _thr = 50.0;

  Widget build(BuildContext context) {
    String _text1 = '$_dot';
    String _text2 = '$_thr';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Confirm',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image(
              image: AssetImage('lib/image/example.jpeg'),
              width: 300,
            ),
          ),
          Center(
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context,Navigator.pop(context,Navigator.pop(context)));
                },
                child: Center(
                  child: Text(
                    'FINISH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
