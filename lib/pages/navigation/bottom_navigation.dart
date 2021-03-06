import 'package:flutter/material.dart';

import '../../models/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.posts : MyTab(name: "Posts", color: Colors.red, icon: Icons.layers),
  TabItem.albums : MyTab(name: "Albums", color: Colors.blue, icon: Icons.image),
  TabItem.todos : MyTab(name: "Todos", color: Colors.green, icon: Icons.edit)
};

class MyBottomNavigation extends StatelessWidget {

  const MyBottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        selectedItemColor: _colorTabMatching(currentTab),
        selectedFontSize: 13,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab.index,

        items: [
          _buildItem(TabItem.posts),
          _buildItem(TabItem.albums),
          _buildItem(TabItem.todos),
        ],

        onTap: (index) => onSelectTab(
            TabItem.values[index]
        )
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {

    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
        color: _colorTabMatching(item),
      ),
      label: tabs[item]!.name,
    );
  }

  IconData _iconTabMatching(TabItem item) => tabs[item]!.icon;

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? tabs[item]!.color : Colors.grey;
  }

}