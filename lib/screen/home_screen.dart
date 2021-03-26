import 'package:flutter/material.dart';
import 'package:jainvivha/theme/light_color.dart';
import 'package:jainvivha/widgets/AppDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage/home_slider.dart';

class HomeScreen extends StatefulWidget {

  //final String email;

// Receiving Email using Constructor.
 // HomeScreen ({Key key, @required this.email}) : super(key: key);
  @override
  _HomeStateScreen createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   // preferences.setString("email", emailController.text);
  }

  static const routeName = "/";
  final String email;

// Receiving Email using Constructor.
  _HomeStateScreen ({Key key, @required this.email}) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Jain Vivha"),
          actions: <Widget>[

            IconButton(
              icon: const Icon(Icons.search),
              onPressed:(){}
            ),

          ],
        ),
        drawer: AppDrawer(),
   body: new SliderPage(),
      );
  }
  }
