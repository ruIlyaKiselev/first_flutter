import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/tab.dart';

class HomeController extends ControllerMVC {

  static HomeController? _this;
  static HomeController? get controller => _this;

  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }

  HomeController._();

  final _navigatorKeys = {
    TabItem.posts: GlobalKey<NavigatorState>(),
    TabItem.albums: GlobalKey<NavigatorState>(),
    TabItem.todos: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, GlobalKey> get navigatorKeys => _navigatorKeys;

  var _currentTab = TabItem.posts;
  TabItem get currentTab => _currentTab;

  void selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

}