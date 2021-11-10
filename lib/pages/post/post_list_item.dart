
import 'package:first_flutter/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {

  Post? post;

  PostListItem(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                post!.title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
            ),
            Container(
              child: Text(
                post!.body,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              padding: const EdgeInsets.all(10),
            ),
          ],
        )
    );
  }

}