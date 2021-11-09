import 'package:flutter/material.dart';
import 'package:mockinstagram/widgets/bottom_navigation_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
