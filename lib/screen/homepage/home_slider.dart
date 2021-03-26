import 'dart:convert';
import 'package:jainvivha/screen/homepage/SliderGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;


class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(

                constraints: BoxConstraints.expand(
                    height: 200

                ),
                child: SliderDemo(),

              ),
              Container(
                child: SliderGrid(),
              ),


            ])

    );
  }
}
class Job {
  final String url;


  Job({this.url,});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      url: json['img'],

    );
  }
}
class SliderDemo extends StatelessWidget {
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
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'http://sharegiants.in/jainvivha/slider_api.php?action=fetch_all';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
Swiper imageSlider(context,data) {
  return new Swiper(
    autoplay: true,
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return new Image.network(
        'http://sharegiants.in/jainvivha/images/slider/'+data[index].url,
        fit: BoxFit.fitWidth,
        width:300 ,

      );
    },

    //viewportFraction: 0.2,

    scale: 1.0,
  );
}

