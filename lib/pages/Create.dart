import 'dart:ui';
import 'package:ant_1/pages/Confirm.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  double _dot = 50.0;
  double _thr = 50.0;

  Widget build(BuildContext context) {
    String _text1 = '$_dot';
    String text1 = _text1;
    String _text2 = '$_thr';
    String _title;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Create',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('lib/image/example.jpeg'),
                    width: 180,
                  ),
                  Text(
                    '元画像',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('lib/image/arrow.jpeg'),
                width: 30,
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('lib/image/example.jpeg'),
                    width: 180,
                  ),
                  Text(
                    'ドット絵',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    ' ドット幅: ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 35,
                    child: TextField(
                      controller: TextEditingController(text: _text1),
                      onChanged: (_text1) {
                        setState(
                          () {
                            try {
                              _dot = _text1 as double;
                            } catch(e) {
                              _text1 = text1;
                            }
                            text1 = _text1;
                          },
                        );
                      },
                      // decoration: InputDecoration(
                      //   border: OutlineInputBorder(),
                      // ),
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                value: _dot,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                onChanged: (double value1) {
                  setState(
                    () {
                      _dot = value1;
                      _text1 = '$_dot';
                    },
                  );
                },
              ),
              Row(
                children: [
                  Text(
                    ' 閾値: ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 35,
                    child: TextField(
                      controller: TextEditingController(text: _text2),
                      onChanged: (_text2) {
                        setState(
                          () {
                            _thr = _text2 as double;
                          },
                        );
                      },
                      // decoration: InputDecoration(
                      //   border: OutlineInputBorder(),
                      // ),
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                value: _thr,
                min: 1.0,
                max: 100.0,
                onChanged: (double value1) {
                  setState(
                    () {
                      _thr = value1;
                      _text2 = '$_thr';
                    },
                  );
                },
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'タイトル',
                ),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: TextEditingController(text: _title),
              ),
            ],
          ),
          Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Confirm();
                  }),
                );
              },
              child: Center(
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
