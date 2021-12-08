import 'package:exercise/column_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackTest extends StatelessWidget {
  const SnackTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2nd Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
          //오른쪽 끝으로 맞춤. stretch는 가로로 꽉채움.
          children: [
            Row(
              children: const [
                Icon(Icons.map),
                Text(
                  '이건 빈공간',
                ),
              ],
            ),
            ElevatedButton(
              child: const Icon(Icons.account_balance),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      '스낵바라네.',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.amber,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('이거 눌러봐.'),
              onPressed: () {
                _flutterToast;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('이건 빽 !'),
            ),
            const Text('이거슨'),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              child: const Text(
                '콘테이너',
                style: TextStyle(color: Colors.black45),
              ),
              width: double.infinity,
              //화면 끝까지 가로로 채움.
              height: 100,
              color: const Color(0xff9F9CE2),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              padding: const EdgeInsets.fromLTRB(40.0, 30.0, 0, 0),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
              color: const Color(0xff78FF85),
              child: const Text('이건 컨테이너 테스트2'),
              width: 200,
              height: 100,
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

final _flutterToast = FlutterToast();

class FlutterToast {
  FlutterToast() {
    Fluttertoast.showToast(
        msg: "이거슨 Toast라네.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
