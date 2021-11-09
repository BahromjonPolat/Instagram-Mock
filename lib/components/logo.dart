import 'package:flutter/material.dart';

Text getLogoText({double? size}) => Text(
      "Instagram",
      style: TextStyle(
        fontSize: size ?? 47.0,
        fontFamily: "Lobster"
      ),
    );
