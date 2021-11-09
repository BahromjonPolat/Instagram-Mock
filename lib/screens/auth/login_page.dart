import 'package:flutter/material.dart';
import 'package:mockinstagram/components/logo.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/widgets/buttons.dart';
import 'package:mockinstagram/widgets/text_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _buildBody(),
      persistentFooterButtons: _persistentFooterButtons(),
    );
  }

  List<Widget> _persistentFooterButtons() {
    return [
      Padding(
        padding: EdgeInsets.only(
          bottom: getProportionateScreenHeight(34.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SetTextWidget("Don't have an account?"),
            setTextButton(() {}, "Sign up"),
          ],
        ),
      ),
    ];
  }

  _buildBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          getLogoText(),
          SizedBox(height: getProportionateScreenHeight(47.0)),
          _showProfileImage(),
          SizedBox(height: getProportionateScreenHeight(13.0)),
          SetTextWidget("bahromjon_polat"),
          SizedBox(height: getProportionateScreenHeight(31.0)),
          Align(
              alignment: Alignment.center,
              child: setElevatedButton(() {}, "Log in")),
          
          setTextButton(() { }, "Switch account", color: kColorBlue),
          const Spacer(),
        ],
      );

  _showProfileImage() => CircleAvatar(
        radius: getProportionateScreenWidth(42.0),
      );
}
