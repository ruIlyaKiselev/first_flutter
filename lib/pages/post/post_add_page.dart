import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {

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
                // здесь мы будем делать запроc на сервер
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