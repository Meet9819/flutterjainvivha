import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:jainvivha/screen/Customer/customer_detail.dart';
import 'package:jainvivha/theme/light_color.dart';






class SummerItems extends StatefulWidget {
  @override
  _SummerItemsState createState() => _SummerItemsState();
}

class _SummerItemsState extends State<SummerItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SummerItemsDemo(),

    );
  }
}

class Job {
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
  Job({this.userId,
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
    this.rashi,this.gotra,this.img});
//List data;
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
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
class SummerItemsDemo extends StatelessWidget {
  //List data;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return imageSlider(context, data);

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(LightColor.midnightBlue),));
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'http://sharegiants.in/jainvivha/customer_api.php';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
imageSlider(context,data) {
  return
    /*new ListView(

    children: <Widget>[
      Container(
       height: 160,
        //width:100,*/

    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cust_Details(todo: data[index])));
            },
            child: Card(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            width: 100,
                            height:100,
                            child:  new Image.network(
                              'http://sharegiants.in/jainvivha/images/customers/'+data[index].img,
                              fit: BoxFit.fitWidth,
                              width: 100,
                            )

                        ),
                        SizedBox(height: 10,),
                        SizedBox( width: 120, height:20,
                            child: Padding( padding: EdgeInsets.only(left: 10,),
                              child:        Row(
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

                                  ]),

                            ) ),
//Divider(),





                      ]
                  ),

                )

            )

        );
      },

      //   ),
      //   ),

//    ],

    );
}


