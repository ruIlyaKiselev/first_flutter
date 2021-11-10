import 'package:first_flutter/controllers/home_controller.dart';
import 'package:first_flutter/pages/navigation/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/tab.dart';
import '../navigation/bottom_navigation.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC {

  HomeController? _homeController;

  _HomePageState() : super(HomeController()) {
    _homeController = HomeController.controller;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: () async {
        if (_homeController?.currentTab != TabItem.posts) {
          if (_homeController?.currentTab == TabItem.todos) {
            _homeController?.selectTab(TabItem.albums);
          } else {
            _homeController?.selectTab(TabItem.posts);
          }
          return false;
        } else {
          return true;
        }

      },
      child: Scaffold(

        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.posts),
          _buildOffstageNavigator(TabItem.albums),
          _buildOffstageNavigator(TabItem.todos),
        ]),

        bottomNavigationBar: MyBottomNavigation(
          currentTab: _homeController!.currentTab,
          onSelectTab: _homeController!.selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // Offstage работает следующим образом:
      // если это не текущий выбранный элемент
      // в нижнем меню, то мы его скрываем
      offstage: _homeController?.currentTab != tabItem,
      // TabNavigator мы создадим позже
      child: TabNavigator(
        navigatorKey: _homeController!.navigatorKeys[tabItem] as GlobalKey<NavigatorState>,
        tabItem: tabItem,
      ),
    );
  }
}