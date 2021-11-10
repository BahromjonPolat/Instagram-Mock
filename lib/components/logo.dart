import 'package:flutter/material.dart';
import 'package:mockinstagram/constants/colors.dart';

Text getLogoText({double? size, Color? color}) => Text(
      "Instagram",
      style: TextStyle(
        fontSize: size ?? 47.0,
        fontFamily: "Lobster",
        color: color ?? kColorBlack
      ),
    );
