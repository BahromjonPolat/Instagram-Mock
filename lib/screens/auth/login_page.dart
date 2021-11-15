import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mockinstagram/components/logo.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/components/size_spacing.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/models/user_model.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

  bool _isLogin = true;

  final FirebaseAuth _mAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      persistentFooterButtons: _buildFooter(),
      body: _isLogin ? _buildLoginPageBody() : _buildSignUpPageBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: kColorTransparent,
        iconTheme: const IconThemeData(color: kColorBlack),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );

  _buildLoginPageBody() => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getLogoText(),
            setHeight(39.0),
            _getLoginFormFields(),
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
            _changePageRow(),
          ],
        ),
      );

  Row _changePageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SetTextWidget(
          _isLogin ? "Don't have an account?" : "Have an account?",
          textColor: kColorBlackWithOpacity,
        ),
        setTextButton(_changePage, _isLogin ? "Sign up." : "Log in",
            color: kColorBlue)
      ],
    );
  }

  void _changePage() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  _buildSignUpPageBody() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            getLogoText(),
            setHeight(57.0),
            _getSignUpFormFields(),
            setHeight(11.0),
            _showForgotPasswordButton(),
            setHeight(22.0),
            setElevatedButton(
              _onSignUpButtonPressed,
              "Sign up",
              size: MediaQuery.of(context).size.width,
            ),
            _loginWithFacebook(),
            _showDivider(),
            _changePageRow(),
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

  Form _getLoginFormFields() => Form(
        key: _formLoginKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: _setInputDecoration("Email"),
              validator: _checkField,
            ),
            setHeight(12.0),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: _setInputDecoration("Password"),
              validator: _checkField,
            ),
          ],
        ),
      );

  Form _getSignUpFormFields() => Form(
        key: _formSignUpKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: _setInputDecoration("Full name"),
              validator: _checkField,
            ),
            setHeight(12.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: _setInputDecoration("Email"),
              validator: _checkField,
            ),
            setHeight(12.0),
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: _setInputDecoration("Username"),
              validator: _checkField,
            ),
            setHeight(12.0),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: _setInputDecoration("Password"),
              validator: _checkField,
            ),
          ],
        ),
      );

  InputDecoration _setInputDecoration(String hint) => InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        contentPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15.0),
        ),
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

  void _onLoginButtonPressed()async {

    if (!_formLoginKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: "Please, Fill all fields");
      return;
    }
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    }


  }

  void _onSignUpButtonPressed() async {
    if (!_formSignUpKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: "Please, Fill all fields");
      return;
    }

    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    await _mAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() async {
      UserModel user = UserModel(
        _mAuth.currentUser!.uid,
        name,
        email,
        password,
        'default',
        username,
        'user',
        false,
      );

      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      fireStore
          .collection("instagramUsers")
          .doc(_mAuth.currentUser!.uid)
          .set(user.toMap());

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
    });
  }

  /// FORM FIELD VALIDATOR
  String? _checkField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please, fill field';
    }

    if (fieldContent.length < 3) {
      return 'Minimum 3 characters';
    }
    return null;
  }
}
