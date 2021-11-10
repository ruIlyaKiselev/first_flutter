import 'package:flutter/material.dart';

import 'pony_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test pony app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PonyListPage(),
    );
  }

}