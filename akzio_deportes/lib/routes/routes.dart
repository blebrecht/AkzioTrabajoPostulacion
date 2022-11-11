import 'package:akzio_deportes/pages/main_page.dart';
import 'package:akzio_deportes/pages/view_page.dart';
import 'package:flutter/material.dart';
Map<String,WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    MainPage.route: (context) => MainPage(),
    ViewPage.route: (context) => ViewPage()
  };
}