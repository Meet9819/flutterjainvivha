import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jainvivha/theme/light_color.dart';
import 'package:localstorage/localstorage.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cust_Details extends StatefulWidget {
  final todo;

  Cust_Details({Key key, @required this.todo}) : super(key: key);

  @override
  _Cust_DetailsState createState() => _Cust_DetailsState();
}

class _Cust_DetailsState extends State<Cust_Details> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String selectedvalue;
  // CarouselController buttonCarouselController = CarouselController();
  List dropdata = List();
  String cart = null;
  /* Future getallvalue() async {
    var data={'itemproductgroupid':widget.todo.itemproductgroupid};
    var response = await http
        .post('http://sharegiants.in/ruchi/dropdown_api.php',body: json.encode(data));
    var jsonbody = response.body;
    var jsondata = json.decode(jsonbody);
    setState(() {
      dropdata = jsondata;
    });
  }
*/
  Future getselectedvalue() async {
    var url = 'http://sharegiants.in/ruchi/dropdown.php';
    var data = {'id': selectedvalue};
    var response = await http.post(url, body: json.encode(data));
    // if(response.statusCode == 200) {
    //var url='http://sharegiants.in/ruchi/dropdown.php';
    // var response = await http.get(url);
    var jsondataval = json.decode(response.body);

    return jsondataval;
    // }
  }

  bool visible = false;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String emailValue = prefs.getString('email');
    return emailValue;
  }

  Future addtofav() async {
    dynamic token = await getStringValuesSF();
    var url = 'http://sharegiants.in/ruchi/addtofav.php';

    var data = {
      'email': token,
      'url': widget.todo.itemproductgroupimage,
      'id': itemid,
      'title': widget.todo.itemname_en,
      'desc': widget.todo.itemproductgrouptitle,
      'price': widget.todo.maxretailprice
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    showInSnackBar(message);
    // SweetAlert.show(context, title:message,confirmButtonColor:LightColor.midnightBlue, );
  }

  Future addtocart() async {
    dynamic token = await getStringValuesSF();
    var url = 'http://sharegiants.in/ruchi/addtocart.php';

    var data = {
      'email': token,
      'url': widget.todo.itemproductgroupimage,
      'id': itemid,
      'title': widget.todo.itemmaingrouptitle,
      'desc': widget.todo.itemproductgrouptitle,
      'price': widget.todo.maxretailprice
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    showInSnackBar(message);
    // SweetAlert.show(context, title:message,confirmButtonColor:LightColor.midnightBlue, );
  }

  int itemid;
  int counter = 1;
  //final productprice;
  double finalprice;

  void increment() {
    setState(() {
      counter++;
      finalprice = double.parse(widget.todo.maxretailprice) * counter;
    });
  }

  void decrement() {
    setState(() {
      counter--;
      finalprice = double.parse(widget.todo.maxretailprice) * counter;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //List<int> sizeList = [7, 8, 9, 10];
    Color cyan = Color(0xff37d6ba);
    //List<Color> colorsList = [Colors.black, Colors.blue, Colors.red];

    int itemCount = 0;
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: LightColor.yellowColor,
      appBar: AppBar(
        title: Text(widget.todo.firstname),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),



          //),
        ],
        // backgroundColor: LightColor.midnightBlue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  //padding: EdgeInsets.only(left: 15, right: 15),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                          // padding: EdgeInsets.only(left: 15, right: 15),
                          height: 300.0,
                          width: 150.0,
                          child: Carousel(
                            images: [
                                  NetworkImage('http://sharegiants.in/jainvivha/images/customers/'+widget.todo.img),
                                  NetworkImage(
                                      'http://sharegiants.in/jainvivha/images/customers/'+widget.todo.img,
                                  ),
                                  NetworkImage(
                                     'http://sharegiants.in/jainvivha/images/customers/'+widget.todo.img,
                                  ),
                                ],
                            dotSize: 6.0,
                            dotSpacing: 15.0,
                            dotColor: LightColor.midnightBlue,
                            indicatorBgPadding: 5.0,
                            dotBgColor: LightColor.yellowColor.withOpacity(0.5),
                            borderRadius: true,
                          )),
                      // SizedBox(),

                      /*  Positioned.fill(
                        child: Image.network(
                          widget.todo.url,
                        ),
                      ),*/
                      SizedBox(height: 10),

                              Padding(
                              padding: EdgeInsets.only( left: 15.0),
                              child: Row(children: <Widget>[
                                      Text(
                                        widget.todo.firstname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        widget.todo.lastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "\(JVC ${widget.todo.userId})",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]),),
                                    SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only( left: 15.0),
                              child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "\Profile Created By- ${widget.todo.profilecreatedby}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.0,
                                                  color: LightColor.grey),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ]),),
                                    SizedBox(height: 20),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        widget.todo.aboutme,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        //overflow: TextOverflow.ellipsis, maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Age-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Height- ${widget.todo.height}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Religion- ${widget.todo.religionid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(width: 2),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Caste- ${widget.todo.subreligionid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Maritial Status- ${widget.todo.maritialstatusid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Education- ${widget.todo.educationtitle}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Occupation- ${widget.todo.occupationid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: LightColor.primaryBackground,
                                        ),
                                        Text(
                                          widget.todo.citytitle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                              color:
                                                  LightColor.primaryBackground),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          widget.todo.statetitle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                              color:
                                                  LightColor.primaryBackground),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          widget.todo.countrytitle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                              color:
                                                  LightColor.primaryBackground),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]),
                                    ),
                                    SizedBox(height: 2),
                                    Divider(
                                      color: Colors.grey[200],
                                      height: 20,
                                      thickness: 10,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        "Personality & Lifestyle",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: LightColor.primaryBackground,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Complexion- ${widget.todo.complexiton}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Body Type- ${widget.todo.bodytype}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(width: 2),
                                          ]),
                                    ),
                                    SizedBox(width: 2),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Drinking Habits- ${widget.todo.drinkinghabit}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Smoking Habits- ${widget.todo.smokinghabit}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Weight- ${widget.todo.weight}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Blood Group- ${widget.todo.bloodgroup}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Physical And Disability- ${widget.todo.physicalstatus}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Language Known- ${widget.todo.languageknown}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Diet- ${widget.todo.diet}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Health Issue(If Any)- ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Hobbies & Interests- ${widget.todo.hobbies}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      color: Colors.grey[200],
                                      height: 20,
                                      thickness: 10,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        "Qualification & Occupation",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: LightColor.primaryBackground,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Highest Education- ${widget.todo.educationtitle}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Sub Education- ${widget.todo.subeducationtitle}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(width: 2),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Employed In- ${widget.todo.employedinid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Occupation- ${widget.todo.occupationid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Occupation Details- ${widget.todo.occupationdetails}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Annual Income- ${widget.todo.annualincomeid}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      color: Colors.grey[200],
                                      height: 20,
                                      thickness: 10,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        "Family Details",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: LightColor.primaryBackground,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Father Name- ${widget.todo.fathername}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                            ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Mother Name- ${widget.todo.mothername}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(width: 2),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\No Of Brother- ${widget.todo.noofbrother}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                               ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\No Of Sister- ${widget.todo.noofsister}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                             ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Native Place- ${widget.todo.nativeplace}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                               ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Family Value- ${widget.todo.familyvalue}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Father Occupation- ${widget.todo.fatheroccupation}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                             ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Mother Occupation- ${widget.todo.motheroccupation}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Married Brother- ${widget.todo.brothermarried}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Married Sister- ${widget.todo.sistermarried}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                               ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Family Type- ${widget.todo.familytype}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 2),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "\Family Status- ${widget.todo.familystatus}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ]),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      color: Colors.grey[200],
                                      height: 20,
                                      thickness: 10,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        "Horoscope Details",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: LightColor.primaryBackground,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(height: 2),
                          Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Horoscope Match?- ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                               ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                    SizedBox(height: 2),
                              Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Manglik- ${widget.todo.manglik}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                               ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(width: 2),
                                        ]), ),
                                    SizedBox(height: 2),
                                  Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Date Of Birth- ${widget.todo.dob} ${widget.todo.dom} ${widget.todo.doy}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                               ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                    SizedBox(height: 2),
                                      Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Time Of Birth- ${widget.todo.hours} ${widget.todo.min} ${widget.todo.ampm}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                               ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                    SizedBox(height: 2),
                                          Padding(
                                              padding: EdgeInsets.only(left: 15.0),
                                              child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Place Of Birth- ${widget.todo.educationtitle}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                    SizedBox(height: 2),
                                              Padding(
                                                  padding: EdgeInsets.only(left: 15.0),
                                                  child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Rashi- ${widget.todo.rashi}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                                  Padding(
                                                      padding: EdgeInsets.only(left: 15.0),
                                                      child:  Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "\Gotra- ${widget.todo.gotra}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]), ),
                                    SizedBox(height: 2),
                                    SizedBox(height: 2),
                                    SizedBox(height: 10),
                                 // ])))
                    ],
                  ),
                ),
              ),
            ]),
          ))
        ],
      ),

      floatingActionButton: Container(
          height: 50.0,
          width: 50.0,
          child: FittedBox(
              child: FloatingActionButton(
            //  icon: Icon(Icons.add_shopping_cart),
            //  label: Text("Add to Cart"),
            backgroundColor: LightColor.primaryBackground,
            onPressed: () {
              addtocart();
            },
            child: Icon(Icons.favorite, color: Colors.white),
          ))),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: LightColor.midnightBlue,
    ));
  }
}

