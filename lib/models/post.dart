import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Post {
  final int? _userId;
  final int? _id;
  final String? _title;
  final String? _body;

  int? get userId => _userId;
  int? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Post(this._userId, this._id, this._title, this._body);

  String toJson() {
    return json.encode({
      "title": _title,
      "content": _body
    });
  }

  Post.fromJson(Map<String, dynamic> json) :
        _userId = json["userId"],
        _id = json["id"],
        _title = json["title"],
        _body = json["body"];
}

class PostList {
  final List<Post> posts = [];

  PostList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      posts.add(Post.fromJson(jsonItem));
    }
  }

}

abstract class PostResult {}

class PostResultSuccess extends PostResult {
  final PostList postList;
  PostResultSuccess(this.postList);
}

class PostResultFailure extends PostResult {
  final String error;
  PostResultFailure(this.error);
}

class PostResultLoading extends PostResult {
  PostResultLoading();
}

abstract class PostAdd {}

class PostAddSuccess extends PostAdd {}
class PostAddFailure extends PostAdd {}