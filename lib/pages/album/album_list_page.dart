import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Album List Page"),
        ),
        body: Container()
    );
  }
}