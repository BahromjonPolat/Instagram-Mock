import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/widgets/text_widgets.dart';

ElevatedButton setElevatedButton(VoidCallback onPressed, String label,
        {double? size}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(14.0),
        ),
        fixedSize: Size(
          getProportionateScreenWidth(size ?? 307),
          getProportionateScreenWidth(44),
        ),
      ),
    );

TextButton setTextButton(
  VoidCallback onPressed,
  String label, {
  Color? color,
  double? size,
}) =>
    TextButton(
      onPressed: onPressed,
      child: SetTextWidget(
        label,
        weight: FontWeight.bold,
        textColor: color,
        size: size,
      ),
    );
