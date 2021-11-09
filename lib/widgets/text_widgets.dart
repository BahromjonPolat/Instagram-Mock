import 'package:flutter/material.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/constants/colors.dart';

class SetTextWidget extends StatelessWidget {
  final String _text;
  final Color? textColor;
  FontWeight? weight;
  double? size;

  SetTextWidget(
    this._text, {
    Key? key,
    this.textColor,
    this.weight,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: textColor ?? kColorBlack,
        fontSize: size ?? getProportionateScreenWidth(14.0),
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
