import 'package:flutter/material.dart';
import '../models/tab.dart';

import 'pony_list_page.dart';

class TabNavigator extends StatelessWidget {

  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      onGenerateRoute: (routeSettings) {

        Widget currentPage;
        if (tabItem == TabItem.POSTS) {
          currentPage = const PonyListPage();
        } else if (tabItem == TabItem.POSTS) {
          currentPage = const PonyListPage();
        } else {
          currentPage = const PonyListPage();
        }

        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }

}