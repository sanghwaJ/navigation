import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  // number 값을 넣어줘도, 안넣어줘도 됨
  final int? number;

  const RouteOneScreen({
    this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route one',
      children: [
        Text(
          'arguments : ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text(
            'pop',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // route는 stack 구조 => [HomeScreen(), RouteOne(), RouteTwo()]
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                )
              ),
            );
          },
          child: Text(
            'push',
          ),
        ),
      ],
    );
  }
}
