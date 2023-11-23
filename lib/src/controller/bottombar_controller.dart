import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt pageIndex = 1.obs;
  List icons = [
    "assets/icons/icon_dashboard.svg","assets/icons/icon_watch.svg","assets/icons/icon_media.svg","assets/icons/icon_more.svg"
  ];
  List bottomBartItems=["Dashboard","Watch","Media Library","More"];

  onTap(index) {
    pageIndex.value = index;
  }

}