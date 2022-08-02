import 'package:flutter/material.dart';

Widget TextWidget(text, color, fsize, fweight) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fsize,
      fontWeight: fweight,
    ),
  );
}