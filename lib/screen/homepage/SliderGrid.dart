import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jainvivha/screen/homepage/customer.dart';
import 'package:jainvivha/theme/light_color.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

class SliderGrid extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
   Text('About Jainvivha',textAlign:TextAlign.left , style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 24.0,color: LightColor.primaryBackground),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text('Welcome To Jainvivha.Com', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22.0,),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text('जैन परिवारों के लिए यह एक बहुत ही अच्छी सौगात है!!!!आज के इस व्यस्त दौर में समय निकालकर अपने लिए मन पसंदीदा जीवनसाथी चयन करना बहुत ही मुश्किल का काम है! इस व्यस्त समय के अभाव को देखते हुए जैन विवाह ने सभी जैन परिवारों को एक मंच पर आमंत्रित किया है चाहे वह देश में रहते हो या विदेश! एवं श्वेतांबर हो या दिगंबर, स्थानकवासी हो या तेरापंथी सभी को एक साथ जोड़ने का फैसला लिया है! जिससे सभी प्रकार के युवक और युवतियां अपने मनपसंद के अनुसार अपना जीवनसाथी चयन कर सकें! चाहे अविवाहित हो या तलाकशुदा, सेपरेट हो या विधवा आप सभी यहां पर अपना प्रोफाइल बना सकते हैं!हमारा मुख्य उद्देश्य यही है कि जेनों को जेनों से जोड़ना, हम चाहते हैं जैनों को मिले जैनों का साथ और जैनों का विवाह जैनों में हो,आज ही अपने पसंदीदा जीवनसाथी से मिलने के लिए अपनी प्रोफाइल रजिस्टर करें फ्री फ्री फ्री और अपने जीवन साथी से जुड़िए!!!',
              style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 15.0,),),
          ),
          Text('वह भी www.jainvivha.com से', style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.0,color: LightColor.primaryBackground),),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text('साथ में कोई भी व्यक्ति, संस्था एवं कंपनी अपने व्यवसाय के बारे में विज्ञापन देना चाहे तो यहां पर दे सकते हैं!! धन्यवाद', style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16.0,),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 175,

            child: SummerItems(),

          ),
        ],
      ),
    );
  }
}

class SliderIndicator extends AnimatedWidget {
  final PageController pageController;
  final int indicatorCount;

  SliderIndicator({this.pageController, this.indicatorCount})
      : super(listenable: pageController);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List<Widget>.generate(indicatorCount, buildIndicator));
  }

  Widget buildIndicator(int index) {
    final page = pageController.position.minScrollExtent == null
        ? pageController.initialPage
        : pageController.page;
    bool active = page.round() == index;
    print("build $index ${pageController.page}");
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Center(
          child: Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}

class Job {
  final String url;


  Job({this.url,});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      url: json['url'],

    );
  }
}
class GalleryDemo extends StatelessWidget {
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
    final jobsListAPIUrl = 'http://sharegiants.in/ruchi/doctor_api.php?action=fetch_all';
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
    //autoplay: true,
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return new Image.network(
        data[index].url,
        fit: BoxFit.fitWidth,

        width:300 ,

      );
    },

    viewportFraction: 0.4,

    scale: 0.5,
  );
}



