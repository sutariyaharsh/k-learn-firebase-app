import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/image_string.dart';

class DashboardTopCoursesModel{
  final String title;
  final String image;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardTopCoursesModel(this.title, this.image, this.heading, this.subHeading, this.onPress);

  static List<DashboardTopCoursesModel> list = [
    DashboardTopCoursesModel("Flutter Crash Course", tBannerFlutterImage, "3 Sections", "Programming Languages", null),
    DashboardTopCoursesModel("HTML/ CSS Crash Course", tBannerFlutterImage, "2 Sections", "35 Lessons", null),
    DashboardTopCoursesModel("Material Design Course", tBannerFlutterImage, "6 Sections", "Programming & Design", null),
  ];
}