import 'package:cooking_app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF6F5FF)),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
