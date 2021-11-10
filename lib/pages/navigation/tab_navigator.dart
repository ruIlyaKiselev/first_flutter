import 'package:first_flutter/pages/post/post_list_page.dart';
import 'package:first_flutter/pages/todo/todo_list_page.dart';
import 'package:flutter/material.dart';

import '../../models/tab.dart';
import '../album/album_list_page.dart';

class TabNavigator extends StatelessWidget {

  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      onGenerateRoute: (routeSettings) {

        Widget currentPage; // = const PonyListPage();

        if (tabItem == TabItem.posts) {
          currentPage = const PostListPage();
        } else if (tabItem == TabItem.albums) {
          currentPage = const AlbumListPage();
        } else {
          currentPage = const TodoListPage();
        }

        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }

}