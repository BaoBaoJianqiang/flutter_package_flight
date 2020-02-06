import 'package:flutter/material.dart';
import 'package:flutter_package_flight/page11.dart';
import 'package:flutter_package_flight/page11_1.dart';

class RouteFlight {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      'page11': (BuildContext context) => new Page11(),
      'page11_1': (BuildContext context) => new Page11_1(),
    };
  }
}
