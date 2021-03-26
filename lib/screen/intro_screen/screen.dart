import 'package:flutter/material.dart';
import 'package:jainvivha/screen/Login/Login_screen.dart';
import 'package:jainvivha/screen/home_screen.dart';
import 'package:jainvivha/screen/intro_screen/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkFirstSeen();
  }
  @override
  Widget build(BuildContext context) {



    return Container();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      var email =prefs.getString("email");
      if(email== null) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginScreen()));
      } else {
        // prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new HomeScreen()));
      }

    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new intro()));
    }
  }
}
