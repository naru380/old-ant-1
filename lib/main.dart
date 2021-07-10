import 'package:flutter/material.dart';
import './pages/top.dart';
import './pages/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'logicmaker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  int _screen = 0;

  List<BottomNavigationBarItem> myBottomNavigationItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: const Text('Top')

      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: const Text('Setting')
      ),
    ];
  }

  @override
  void initState() {
    super .initState();

    _pageController = PageController(
      initialPage: _screen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],

      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _screen = index;
          });
        },
        children: [
          TopScreen(),
          SettingScreen(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _screen,
      //   onTap: (index){
      //     setState(() {
      //       _screen = index;
      //       _pageController.animateToPage(index,
      //           duration: Duration(milliseconds: 1), curve: Curves.easeOut);
      //     });
      //   },
      //   items: myBottomNavigationItems(),
      // ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
