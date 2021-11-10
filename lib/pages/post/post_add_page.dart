import 'package:first_flutter/controllers/post_controller.dart';
import 'package:first_flutter/models/post.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends StateMVC {

  PostController? _controller;

  _PostDetailPageState() : super(PostController()) {
    _controller = controller as PostController;
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Add Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final post = Post(
                    -1, -1, titleController.text, contentController.text
                );

                _controller!.addPost(post, (status) {
                  if (status is PostAddSuccess) {
                    Navigator.pop(context, status);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Произошла ошибка при добавлении поста"))
                    );
                  }
                });
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.face),
                hintText: "Заголовок"
            ),

            controller: titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Заголовок пустой";
              }
              if (value.length < 3) {
                return "Заголовок должен быть не короче 3 символов";
              }
              return null;
            },
          ),

          const SizedBox(height: 10),

          Expanded(
            child: TextFormField(
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Содержание",
              ),
              controller: contentController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Содержание пустое";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}