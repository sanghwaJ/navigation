import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 위젯 트리에서 가장 가까운 ModalRoute(풀스크린 route)를 가져옴
    // null이 될 수도 있으니, !로 처리해주어야 에러 표시가 나지 않음
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments : ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'pop',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // main.dart에 지정해 둔 route의 이름(String)을 사용할 수 있음
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999, // pushNamed를 통해 arguments를 전달하는 가장 쉬운 방법
            );
          },
          child: Text(
            'push named',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // 원 상태 => [HomeScreen(), RouteOne(), RouteTwo()]
            // RouteThree push => [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
            // RouteThree pushReplacement => [HomeScreen(), RouteOne(), RouteThree()] (맨 마지막(RouteTwo)을 대체하여 push)
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: Text(
            'push replacment',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              // false면 route 모두 삭제, true면 route 삭제하지 않음
              // 아래처럼 조건을 주면, route name이 '/'인 것은 true로 두어 삭제하지 않고, 나머지는 false로 모두 삭제함
              (route) => route.settings.name == '/',
            );
          },
          child: Text(
            'push and remove until',
          ),
        ),
      ],
    );
  }
}
