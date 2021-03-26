import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jainvivha/splash_screen.dart';
import 'package:jainvivha/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Jain Vivha',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),

    );
  }
}
