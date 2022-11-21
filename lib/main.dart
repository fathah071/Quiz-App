import 'package:flutter/material.dart';

import 'package:quiz/views/splash_screen.dart';
import 'package:quiz/views/start_screen.dart';

import 'controller/provider.dart';


import 'package:quiz/views/win_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Changes>(
    create: (context) => Changes(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  ));
}
