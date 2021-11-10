import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mockinstagram/components/logo.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/components/size_spacing.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/screens/home/home_page.dart';
import 'package:mockinstagram/widgets/buttons.dart';
import 'package:mockinstagram/widgets/text_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      persistentFooterButtons: _buildFooter(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: kColorTransparent,
        iconTheme: const IconThemeData(color: kColorBlack),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );

  _buildBody() => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getLogoText(),
            setHeight(39.0),
            _getFormFields(),
            setHeight(11.0),
            _showForgotPasswordButton(),
            setHeight(22.0),
            setElevatedButton(
              _onLoginButtonPressed,
              "Log in",
              size: MediaQuery.of(context).size.width,
            ),
            setHeight(30.5),
            _loginWithFacebook(),
            setHeight(33.0),
            _showDivider(),
            setHeight(33.50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SetTextWidget(
                  "Don't have an account?",
                  textColor: kColorBlackWithOpacity,
                ),
                setTextButton(() {}, "Sign up.", color: kColorBlue)
              ],
            ),
          ],
        ),
      );

  TextButton _loginWithFacebook() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.facebook),
      label: SetTextWidget(
        "Log in with Facebook",
        weight: FontWeight.w600,
        textColor: kColorBlue,
      ),
    );
  }

  Align _showForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: setTextButton(() {}, "Forgot password?", color: kColorBlue),
    );
  }

  Form _getFormFields() => Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: _setInputDecoration("Email"),
            ),
            setHeight(12.0),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: _setInputDecoration("Password"),
            ),
          ],
        ),
      );

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        contentPadding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15.0)),
        hintText: hint,
        hintStyle: TextStyle(
            color: const Color(0x33000000),
            fontSize: getProportionateScreenWidth(14.0),
            fontWeight: FontWeight.w400),
        border: _setBorder(),
        enabledBorder: _setBorder(),
        focusedBorder: _setBorder(),
      );

  OutlineInputBorder _setBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: kColorBlackWithOpacity,
          width: 0.5,
        ),
      );

  List<Widget> _buildFooter() {
    return [
      Center(
          child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(24.5)),
        child: SetTextWidget(
          "Instagram от Facebook",
          textColor: kColorBlackWithOpacity,
        ),
      ))
    ];
  }

  _showDivider() => Row(
        children: [
          const Expanded(child: Divider()),
          setWidth(30.5),
          SetTextWidget(
            "OR",
            textColor: kColorBlackWithOpacity,
            size: 12.0,
            weight: FontWeight.w600,
          ),
          setWidth(30.5),
          const Expanded(child: Divider()),
        ],
      );

  void _onLoginButtonPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}
