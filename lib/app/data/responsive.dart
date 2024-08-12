import 'package:flutter/material.dart';
import 'package:get/get.dart';

double responsiveHeight(double height) {
  var mediaQuery = MediaQuery.of(Get.context!).size;
  var divide = 812 / height;
  var height1 = mediaQuery.height / divide;
  return height1;
}

double responsiveWidth(double width) {
  var mediaQuery = MediaQuery.of(Get.context!).size;

  var divide = 375 / width;
  var width1 = mediaQuery.width / divide;
  return width1;
}

double responsiveText(double size) {
  return (responsiveHeight(size) + responsiveWidth(size)) / 2;
}
