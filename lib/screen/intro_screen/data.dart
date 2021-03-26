import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Contact genuine profiles with 100% verified mobile numbers");
  sliderModel.setTitle("Genuine Profiles");
  sliderModel.setImageAssetPath("assets/1stscreen.png", );
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Search by location, community, profession & more. Get matches on email as per your preferences");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/2ndscreen.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Control who can see your profile and pictures with advanced privacy settings");
  sliderModel.setTitle("Privacy");
  sliderModel.setImageAssetPath("assets/3rdscreen.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}