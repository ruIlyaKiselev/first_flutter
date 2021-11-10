import 'package:first_flutter/controllers/post_controller.dart';
import 'package:first_flutter/models/post.dart';
import 'package:first_flutter/pages/post/post_add_page.dart';
import 'package:first_flutter/pages/post/post_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends StateMVC {

  PostController? _controller;

  _PostListPageState() : super(PostController()) {
    _controller = controller as PostController;
  }

  @override
  void initState() {
    super.initState();
    _controller?.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post List Page"),
        ),
        body: _buildContent(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const PostDetailPage()
            )).then((value) {
              if (value is PostAddSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Пост был успешно добавлен"))
                );
              }
            });
          },
      ),
    );
  }

  Widget _buildContent() {
    final state = _controller?.currentState;
    if (state is PostResultLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PostResultFailure) {
      return Center(
        child: Text(
            state.error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.red)
        ),
      );
    } else {
      final posts = (state as PostResultSuccess).postList.posts;
      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostListItem(posts[index]);
          },
        ),
      );
    }
  }

}