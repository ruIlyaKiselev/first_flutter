import 'dart:convert';

import 'package:first_flutter/models/post.dart';
import 'package:http/http.dart' as http;

const String serverAddress = "https://jsonplaceholder.typicode.com";

class Repository {

  Future<PostList> fetchPosts() async {

    final url = Uri.parse("$serverAddress/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed request");
    }
  }

  Future<PostAdd> addPost(Post post) async {
    final url = Uri.parse("$serverAddress/posts");

    final response = await http.post(url, body: post.toJson());

    if (response.statusCode == 201) {
      return PostAddSuccess();
    } else {
      return PostAddFailure();
    }
  }
}