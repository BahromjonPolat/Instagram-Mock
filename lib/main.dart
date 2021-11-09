import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/screens/auth/login_page.dart';
import 'package:mockinstagram/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mock Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: kColorBlue,
      ),
      home: const LoginPage(),
    );
  }
}
