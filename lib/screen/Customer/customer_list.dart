import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jainvivha/screen/Customer/customer_detail.dart';
import 'package:jainvivha/theme/light_color.dart';
import 'package:jainvivha/widgets/AppDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomerList extends StatefulWidget {

  @override
  _CustomerListState createState() => _CustomerListState();
}

class CustomerData {
  final String userId;
  final String firstname;
  final String lastname;
  final String userEmail;
  final String contactno;
  final String pincode;
  final String address;
  final String timetocall;
  final String whatsappno;
  final String gender;
  final String type;
  final String aboutme;
  final String religionid;
  final String subreligionid;
  final String dob;
  final String dom;
  final String hours;
  final String min;
  final String ampm;
  final String city;
  final String citytitle;
  final String countrytitle;
  final String district;
  final String profilecreatedby;
  final String maritialstatusid;
  final String noofchildrenid;
  final String height;
  final String mothertoungeid;
  final String educationtitle;
  final String occupationid;
  final String statetitle;
  final String complexiton;
  final String bodytype;
  final String drinkinghabit;
  final String smokinghabit;
  final String weight;
  final String bloodgroup;
  final String physicalstatus;
  final String languageknown;
  final String diet;
  final String hobbies;
  final String subeducationtitle;
  final String employedinid;
  final String occupationdetails;
  final String annualincomeid;
  final String fathername;
  final String mothername;
  final String noofbrother;
  final String noofsister;
  final String nativeplace;
  final String familyvalue;
  final String fatheroccupation;
  final String motheroccupation;
  final String brothermarried;
  final String sistermarried;
  final String familytype;
  final String familystatus;
  final String manglik;
  final String doy;
  final String rashi;
  final String gotra;
  final String img;

  CustomerData(
      {this.userId,
        this.firstname,
        this.lastname,
        this.userEmail,
        this.contactno,
        this.pincode,
        this.address,
        this.timetocall,
        this.whatsappno,
        this.gender,
        this.aboutme,
        this.religionid,
        this.subreligionid,
        this.dob,
        this.dom,
        this.hours,
        this.min,
        this.ampm,
        this.city,
        this.citytitle,
        this.district,
        this.profilecreatedby,
        this.maritialstatusid,
        this.noofchildrenid,
        this.type, this.countrytitle,
        this.height,this.mothertoungeid,
        this.educationtitle,this.occupationid,
        this.statetitle,
        this.complexiton,
        this.bodytype,
        this.drinkinghabit,
        this.smokinghabit, this.weight,
        this.bloodgroup,this.physicalstatus,
        this.languageknown,this.diet,
        this.hobbies,
        this.subeducationtitle, this.employedinid,
        this.occupationdetails,this.annualincomeid,
        this.fathername,this.mothername,
        this.noofbrother,
        this.noofsister, this.nativeplace,
        this.familyvalue,this.fatheroccupation,
        this.motheroccupation,this.brothermarried,
        this.sistermarried,
        this.familytype, this.familystatus,
        this.manglik,this.doy,
        this.rashi,this.gotra,this.img
        });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
        userId: json['userId'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        userEmail: json['userEmail'],
        contactno: json['contactno'],
        pincode: json['pincode'],
        address: json['address'],
        timetocall: json['timetocall'],
        whatsappno: json['whatsappno'],
        gender: json['gender'],
        aboutme: json['aboutme'],
        religionid: json['religionid'],
        subreligionid: json['subreligionid'],
        dob: json['dob'],
        dom: json['dom'],
        hours: json['hours'],
        min: json['min'],
        ampm: json['ampm'],
        city: json['city'],
        citytitle: json['citytitle'],
        district: json['district'],
        profilecreatedby: json['profilecreatedby'],
      maritialstatusid: json['maritialstatusid'],
      noofchildrenid: json['noofchildrenid'],
      type: json['type'],
      countrytitle: json['countrytitle'],
      height: json['height'],
      mothertoungeid: json['mothertoungeid'],
      educationtitle: json['educationtitle'],
      occupationid: json['occupationid'],
      statetitle: json['statetitle'],
      complexiton: json['complexiton'],
      bodytype: json['bodytype'],
      drinkinghabit: json['drinkinghabit'],
      smokinghabit: json['smokinghabit'],
      weight: json['weight'],
      bloodgroup: json['bloodgroup'],
      physicalstatus: json['physicalstatus'],
      languageknown: json['languageknown'],
      diet: json['diet'],
      hobbies: json['hobbies'],
      subeducationtitle: json['subeducationtitle'],
      employedinid: json['employedinid'],
      occupationdetails: json['occupationdetails'],
      annualincomeid: json['annualincomeid'],
      fathername: json['fathername'],
      mothername: json['mothername'],
      noofbrother: json['noofbrother'],
      noofsister: json['noofsister'],
      nativeplace: json['nativeplace'],
      familyvalue: json['familyvalue'],
      fatheroccupation: json['fatheroccupation'],
      motheroccupation: json['motheroccupation'],
      brothermarried: json['brothermarried'],
      sistermarried: json['sistermarried'],
      familytype: json['familytype'],
      familystatus: json['familystatus'],
      manglik: json['manglik'],
      doy: json['doy'],
      rashi: json['rashi'],
      gotra: json['gotra'],
        img:json['img'],
);
  }
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customers"),

      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<CustomerData>>(
        future: _fetchItemGrpData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CustomerData> data = snapshot.data;
            return Grid(context, data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String emailValue = prefs.getString('email');
    return emailValue;
  }
  Future<List<CustomerData>> _fetchItemGrpData() async {
    dynamic token = await getStringValuesSF();
    var data = {'email': token};
    final url = 'http://sharegiants.in/jainvivha/customer_api.php';

    var response = await http.post(url, body: json.encode(data));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new CustomerData.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}

Grid(context, data) {
  return
  GridView.builder(
    itemCount: data.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.4),
        crossAxisCount: 1),
    scrollDirection: Axis.vertical,

    itemBuilder: (context, index) {
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cust_Details(todo: data[index])));
          },
          // var finalprice = data[index].price;
          child: Padding(
            padding: EdgeInsets.all(5.0),
      child: Card(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300], width: 1.5),
                    top: BorderSide(color: Colors.grey[300], width: 1.5),
                  )),
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    height: 400.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                       image: DecorationImage(
                            image:
                            NetworkImage('http://sharegiants.in/jainvivha/images/customers/'+data[index].img,),
                          fit: BoxFit.fitWidth)),
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                children: <Widget>[

                             Text(
                                  data[index].firstname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,

                                ), SizedBox(width: 2),
                              Text(
                                data[index].lastname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0),
                                overflow: TextOverflow.ellipsis,

                              ), SizedBox(width: 2),
                              Text(
                                "\(JVC${data[index].userId})",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0),
                                overflow: TextOverflow.ellipsis,

                              ),
                            ]),
                            SizedBox(height: 10),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              Expanded(
                                child: Text(
                                  "\ Profile Created By- ${data[index].profilecreatedby}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 13.0,color:LightColor.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                            SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              Text(
                                "\Age-${data[index].lastname}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ]),
                            SizedBox(height: 2),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text( "\Height- ${data[index].height}",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                    overflow: TextOverflow.ellipsis,),
                                ]),SizedBox(height: 2),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              Text(
                                "\Religion- ${data[index].religionid}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                overflow: TextOverflow.ellipsis,
                              ), SizedBox(width: 2),

                            ]),  SizedBox(height: 2),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text( "\Caste- ${data[index].subreligionid}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                          overflow: TextOverflow.ellipsis,),
                      ]),
                            SizedBox(height: 2),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                              Text( "\Maritial Status- ${data[index].maritialstatusid}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                overflow: TextOverflow.ellipsis,),
                            ]),
                            SizedBox(height: 2),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              Text(
                                "\Education- ${data[index].educationtitle}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ]),
                            SizedBox(height: 2),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                              Text( "\Occupation- ${data[index].occupationid}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,),
                                overflow: TextOverflow.ellipsis,),
                            ]),
                            SizedBox(height: 10),
                            Row(
                                children: <Widget>[
                                  Icon(Icons.location_on,color:LightColor.primaryBackground ,),
                                  Text(
                                    data[index].citytitle,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,color:LightColor.primaryBackground),
                                    overflow: TextOverflow.ellipsis,
                                  ),SizedBox(width: 2),
                                  Text( data[index].statetitle,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,color:LightColor.primaryBackground),
                                    overflow: TextOverflow.ellipsis,),SizedBox(width: 2),
                                  Text( data[index].countrytitle,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0,color:LightColor.primaryBackground),
                                    overflow: TextOverflow.ellipsis,),
                                ]),
                            SizedBox(height: 2),


                            /* Row(
      children: <Widget>[
                            Expanded(
                              child: Text(
                                data[index].minretailprice,
                                style: TextStyle(fontWeight: FontWeight
                                    .w600, fontSize: 15.0),overflow: TextOverflow.ellipsis,),
                            ),]),*/
                          ],
                        ),
                      ))
                ],
              ),
            ),
      ) ));
    },
  );
}

getprice(max, min) {
  if (max == min) {
    return Row(children: <Widget>[
      Expanded(
        child: Text(
          "\QR ${max}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color:LightColor.midnightBlue),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  } else {
    return Row(children: <Widget>[
      Text(
        "\QR ${max}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color:LightColor.midnightBlue),
        overflow: TextOverflow.ellipsis,
      ),
      Text(" - "),
      Text(
        "\QR ${min}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color:LightColor.midnightBlue),
        overflow: TextOverflow.ellipsis,
      ),
    ]);
  }
}
