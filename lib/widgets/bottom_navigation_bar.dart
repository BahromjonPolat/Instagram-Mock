import 'package:flutter/material.dart';
import 'package:mockinstagram/constants/colors.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _bottomNavigationBarItems(),
      selectedItemColor: kColorBlack,
      unselectedItemColor: kColorBlack,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

   List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
     BottomNavigationBarItem(
      icon: Icon(_currentIndex == 0 ? Icons.home_filled : Icons.home_outlined),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: "Add",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "Favourites",
    ),
    const BottomNavigationBarItem(
      icon: CircleAvatar(),
      label: "Profile",
    ),
  ];
}
