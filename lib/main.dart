import 'dart:js';

import 'package:flutter/material.dart';
import 'FirstTab.dart';
import 'SecondTab.dart';
import 'ThirdTab.dart';
import 'FourthTab.dart';
import 'FifthTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Memo4Service()),
        ChangeNotifierProvider(create: (context) => Memo5Service()),
        ChangeNotifierProvider(create: (context) => Memo3Service()),
        ChangeNotifierProvider(create: (context) => Memo2Service()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            children: [
              FirstTab(),
              SecondTab(),
              ThirdTab(),
              FourthTab(),
              FifthTab(),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: TabPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      color: DefaultTabController.of(context).index == 1
          ? Colors.black38
          : Colors.grey[400],
      selectedColor: DefaultTabController.of(context).index == 1
          ? Colors.white
          : Colors.black26,
      indicatorSize: 8,
    );
  }
}
