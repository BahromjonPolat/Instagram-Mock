import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/data/page_data.dart';



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
          PageData.currentIndex = index;
          _currentIndex = index;
        });
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 0
                ? "assets/icons/home_active_icon.svg"
                : "assets/icons/home_icon.svg",
            height: 24.0,
            color: kColorBlack,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 1
                ? "assets/icons/search_active_icon.svg"
                : "assets/icons/search_icon.svg",
            height: 24.0,
            color: kColorBlack,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 2
                ? "assets/icons/upload_active_icon.svg"
                : "assets/icons/upload_icon.svg",
            height: 24.0,
            color: kColorBlack,
          ),
          label: "Upload",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 3
                ? "assets/icons/love_active_icon.svg"
                : "assets/icons/love_icon.svg",
            height: 24.0,
            color: kColorBlack,
          ),
          label: "Favourite",
        ),
        const BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 12.5,
          ),
          label: "Home",
        ),
      ];

}
