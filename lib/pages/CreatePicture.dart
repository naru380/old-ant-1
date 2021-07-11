import 'package:flutter/material.dart';

class AddAction extends StatefulWidget {
  @override
  _AddActionState createState() => _AddActionState();
}

List<Widget> containerChild = [];

class _AddActionState extends State<AddAction> {
  int count = 0;

  void _handlePressed() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "$count",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 100,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     widget.message.toString(),
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 100,
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment(1.0, 1.0),
              child: IconButton(
                iconSize: 100,
                color: Colors.red,
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  _handlePressed();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // tooltip: 'Action!',
        label: Text('Add'),
        onPressed: () {
          Navigator.pop(
            context,
            count,
          );
        },
      ),
    );
  }
}

