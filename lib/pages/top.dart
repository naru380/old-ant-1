import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ant_1/pages/Confirm.dart';
import 'package:ant_1/pages/Create.dart';
import 'package:ant_1/pages/setting.dart';
// import './CreatePicture.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => TopScreen());
      case '/create':
        return MaterialPageRoute(
          builder: (_) => Create(),
        );
      case '/confirm':
        MaterialPageRoute(
          builder: (_) => Confirm(),
        );
    }
  }
}

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'logic_maker',
      home: TopScreen(),
    );
  }
}

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

List<Widget> containerChild = [];

class _TopScreenState extends State<TopScreen> {
  int cnt = 0;

  @override
  void initState() {
    super.initState();
    cnt = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[900],
        title: Text(
          'Top',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
          containerChild.length,
          (int index) {
            return containerChild[index];
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showCupertinoDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text('ドット絵作成'),
                content: const Text('取り込み方を選択してください'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('カメラ'),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Create();
                          },
                        ),
                      );
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text('カメラロール'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Create();
                          },
                        ),
                      );
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class ActionContainer extends StatefulWidget {
  ActionContainer(int cnt);

  @override
  _ActionContainerState createState() => _ActionContainerState();
}

class _ActionContainerState extends State<ActionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              print(this.widget);
              print(containerChild);
              // print(containerChild[ind]);
              // var del = this;
              containerChild.remove(this);
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.0),
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$widget.cnt',
                    style: TextStyle(
                      // color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
