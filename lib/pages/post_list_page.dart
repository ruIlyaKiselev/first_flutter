import 'package:first_flutter/controllers/post_controller.dart';
import 'package:first_flutter/models/post.dart';
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
        body: _buildContent()
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
            return _buildPostItem(posts[index]);
          },
        ),
      );
    }
  }

  Widget _buildPostItem(Post post) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.3)
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                post.title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
            ),
            Container(
              child: Text(
                post.body,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              padding: const EdgeInsets.all(10),
            ),
          ],
        )
    );
  }

}