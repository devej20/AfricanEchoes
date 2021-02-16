import 'package:african_echoes/model/model.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  const TabSelector({Key key, this.activeTab, this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) {
        onTabSelected(AppTab.values[index]);
      },
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(icon: Icon(Icons.person), label: "");
      }).toList(),
    );
  }
}
