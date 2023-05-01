import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // android system 상 뒤로가기 버튼 클릭 시, 제어할 수 있는 함수
      onWillPop: () async {
        // true => pop 가능 / false => pop 불가능
        // canPop => pop을 할 수 있을지 없을지에 대한 값을 bool로 리턴함
        final canPop = Navigator.of(context).canPop();
        return canPop;
      },
      child: MainLayout(
        title: 'HomeScreen',
        children: [
          ElevatedButton(
            onPressed: () {
              // pop 에러 방지 => 더 이상 뒤로가기할 페이지가 없을 때(Navigator가 더 이상 없을 때)는 pop을 하지 않음
              Navigator.of(context).maybePop();
            },
            child: Text(
              'maybe pop',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );
              print(result);
            },
            child: Text(
              'push',
            ),
          ),
        ],
      ),
    );
  }
}
