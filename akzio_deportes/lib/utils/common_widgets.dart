import 'package:akzio_deportes/pages/view_page.dart';
import 'package:flutter/material.dart';

import '../pages/main_page.dart';

class CommonWidgets {
  static AppBar getAppBar(String title,BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text("Akzio - $title"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(MainPage.route,(Route<dynamic> route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.view_column_sharp),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(ViewPage.route,(Route<dynamic> route) => false);
            },
          )
        ]
    );
  }
}
