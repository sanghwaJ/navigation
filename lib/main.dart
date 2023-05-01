import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';
import 'package:navigation/screen/route_two_screen.dart';

// 이런식으로 route를 관리해 주는 것을 권장함
const HOME_ROUTE = '/';

void main() {
  runApp(
    MaterialApp(
      // 최초 Route 지정
      initialRoute: '/',
      // URI 형태로 구현
      routes: {
        HOME_ROUTE: (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
