import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/splash.dart';

void main() {
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    home: splash(),
    theme: ThemeData(
      // backgroundColor: Color(0xffb90606),
      primarySwatch: Colors.teal,
    ),
  ));
}
