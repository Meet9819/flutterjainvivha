import 'package:flutter/material.dart';
import 'package:jainvivha/screen/Login/Login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:jainvivha/widgets/bezierContainer.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegistrationScreen> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;
  static const Color midnightBlue = const Color.fromRGBO(1, 4, 99,1);
  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'http://sharegiants.in/jainvivha/register_user.php';

    // Store all data with Param Name.
    var data = {'name': name, 'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }






  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color.fromRGBO(238, 38, 84, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset('assets/jlogo.png'),
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ),

        ),
      TextField(
      controller: nameController,
      decoration: InputDecoration(

          border: InputBorder.none,
          fillColor: Color(0xfff3f3f4),
          filled: true
      ),),
        SizedBox(
          height: 10,
        ),
        Text(
          "Email Id",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(

              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true
          ),),
        SizedBox(
          height: 10,
        ),
        Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                     Center(
                      child: Button(
                        onClick: userRegistration,

                        btnText: "Registration",
                      ),

                    ),
                   // SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class Button extends StatelessWidget {
  var btnText ="";
  var onClick;


  Button({this.btnText, this.onClick});
  Color yellowColors = Color.fromRGBO(238, 38, 84, 1);
  static const Color midnightBlue = const Color(0xfff3f3f4);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,

    child: Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 15),
    alignment: Alignment.center,

    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(50),),
    boxShadow: <BoxShadow>[
    BoxShadow(
    color: Colors.grey.shade200,
    offset: Offset(2, 4),
    blurRadius: 5,
    spreadRadius: 2)
    ],
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [yellowColors,Color.fromRGBO(238, 38, 84, 1)])),
    child: InkWell(
    child: Text(
    'Register Now',
    style: TextStyle(fontSize: 20, color:midnightBlue,fontWeight: FontWeight.bold),
    ),


    ),
    )
    );
  }
}
