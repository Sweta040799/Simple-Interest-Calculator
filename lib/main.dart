import 'package:flutter/material.dart';

import 'app_screens/first_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator',
    home: MainForm(),
    theme: ThemeData(
     brightness: Brightness.dark
    ),
  )
  );
}
