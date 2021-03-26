import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jainvivha/screen/Customer/customer_list.dart';
import 'package:jainvivha/screen/fmc_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppDrawer extends StatefulWidget {
  //final String email;
  @override
  static const Color midnightBlue = const Color.fromRGBO(238, 38, 84,1);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var username;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Return String
    setState(() {
      username = prefs.getString("email");
    });
  }

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                color: AppDrawer.midnightBlue
                   ),

               accountName: Text('${username}', style: TextStyle( fontSize: 15.0,color: Colors.white.withOpacity(1.0)),),

               currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                ? new Color.fromRGBO(238, 38, 84, 1)
                 : Colors.white,
                  child: Icon(
                   Icons.person,
                    size: 50,
                      color: Color.fromRGBO(238, 38, 84, 1)
                 ),
                 ),
              ),
          //  DrawerHeader(

           //   child: Container(
           //     child: Text('${email}', style: TextStyle(color: Colors.white.withOpacity(1.0)),),
           //     alignment: Alignment.bottomLeft, // <-- ALIGNMENT
            //    height: 10,
          //    ),
            //  decoration: BoxDecoration(
           //       color: midnightBlue
           //   ),
         //   ),
            Divider(),
            ListTile(

              leading: Icon(Icons.person,color: Colors.black,),
              title: Text('All Customers' , style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerList()));
              },
            ),





            ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text('Shortlist', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {

              },
            ),

            ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text('Your Account', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text('Order History', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text('Track Your Orders', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),
            Divider(color: AppDrawer.midnightBlue),
            ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text('All Branches', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.black,),
              title: Text('About Us', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: new Image.asset(
                "assets/Drawer/contactus.png",
                  width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Contact Us', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),
            Divider(color: AppDrawer.midnightBlue),
            ListTile(
              leading: new Image.asset(
                "assets/Drawer/terms.png",
                  width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Terms & Condition', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: new Image.asset(
                "assets/Drawer/privacy.png",
                  width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Privacy Policy', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: new Image.asset(
                "assets/Drawer/delivery.png",
                  width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Delivery Information', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),

            ListTile(
              leading: new Image.asset(
                "assets/Drawer/delivery.png",
                width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Refund & Replacement', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
              },
            ),
            Divider(color: AppDrawer.midnightBlue),
            ListTile(
              leading: new Image.asset(
                "assets/Drawer/logout.png",
                width: 20.0,color: AppDrawer.midnightBlue
              ),
              title: Text('Log Out', style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => logout())
                );
              },
            ),

          ],
        )







    );
  }
}