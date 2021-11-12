import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {

  final fileImages = [
    "image1.png",
    "image2.jpeg",
    "image3.jpg",
    "image4.jpeg",
    "image5.jpg",
    "image6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Album List Page"),
        ),
        body: _buildContent()
    );
  }

  Widget _buildContent() {
    return StaggeredGridView.countBuilder(
      itemCount: fileImages.length,
      crossAxisCount: 8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(4, index % 2 == 0 ? 4 : 8);
      },

      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pinkAccent, width: 1)
          ),
          child: Image.asset("images/${fileImages[index]}"),
        );
      },
    );
  }
}