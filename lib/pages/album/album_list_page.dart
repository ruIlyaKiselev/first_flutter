import 'package:first_flutter/controllers/album_controller.dart';
import 'package:first_flutter/models/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends StateMVC {

  late AlbumController _controller;

  _AlbumListPageState() : super(AlbumController()) {
    _controller = controller as AlbumController;
  }

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

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

    final state = _controller.currentState;

    if (state is PhotoResultLoading) {
      return const Center(
          child: CircularProgressIndicator()
      );
    } else if (state is PhotoResultFailure) {
      return Center(
        child: Text(
            state.error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red)
        ),
      );
    } else {
      final images = (state as PhotoResultSuccess).photoList.photos;

      return StaggeredGridView.countBuilder(
        itemCount: images.length,
        crossAxisCount: 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        staggeredTileBuilder: (index) {
          return const StaggeredTile.count(4, 4);
        },

        itemBuilder: (context, index) {
          return Container(

              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),

                  child: Image.network(
                      images[index].url!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.scaleDown,
                      loadingBuilder: (context, widget, imageChunkEvent) {
                        if (imageChunkEvent == null) {
                          return widget;
                        }
                        return const Center(child: Text("Loading..."));
                      },
                      errorBuilder: (context, obj, stacktrace) => const Center(child: Text("Error!"))
                  )
              )
          );
        },
      );
    }
  }
}