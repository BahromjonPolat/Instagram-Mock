import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mockinstagram/components/logo.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/data/page_data.dart';
import 'package:mockinstagram/screens/favourite/favourites_page.dart';
import 'package:mockinstagram/screens/home/home_page_body.dart';
import 'package:mockinstagram/screens/profile/profile_page.dart';
import 'package:mockinstagram/screens/search/search_page.dart';
import 'package:mockinstagram/screens/upload/upload_page.dart';
import 'package:mockinstagram/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    _currentIndex = PageData.currentIndex;
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: _currentPage(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kColorTransparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: getLogoText(size: 27.99),
      iconTheme: const IconThemeData(color: kColorBlack),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/message_icon.svg",
            color: kColorBlack,
            height: 19.5,
          ),
        )
      ],
    );
  }


  List<Widget> _pageList() => [
    const HomePageBody(),
    const SearchPage(),
    const UploadPage(),
    const FavouritesPage(),
    const ProfilePage(),
  ];
  Widget _currentPage() => _pageList()[_currentIndex!];
}
