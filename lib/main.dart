import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/core/app_colors.dart';
import 'package:tic_tac_toe/app/modules/intro/intro_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe Game",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.grey900,
        primarySwatch: Colors.red,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
