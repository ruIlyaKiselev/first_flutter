import 'package:flutter/material.dart';

import 'pony_list_page.dart';

class PonyDetailPage extends StatelessWidget {

  final int ponyId;

  const PonyDetailPage(this.ponyId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pony = ponies[ponyId];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Pony Detail Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),

                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)
                    ),

                    color: Colors.lightBlueAccent,
                  ),
                  child: Text(
                    pony.name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    // указываем описание pony
                      pony.desc,
                      style: Theme.of(context).textTheme.bodyText1
                  )
              )
            ],
          ),
        )
    );
  }
}