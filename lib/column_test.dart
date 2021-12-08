import 'package:exercise/second_test.dart';
import 'package:exercise/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnTest extends StatelessWidget {
  ColumnTest(this.a, this.b, {Key? key}) : super(key: key);
  String a = '';
  String b = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (anythingOk) => const SnackTest()));
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                color: const Color(0xff78E2FF),
                child: Text('$a \n$b', style: const TextStyle(color: Colors.black),),
                width: 200,
                height: 100,
              ),
            ),



            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (anything) => const SecondTest()));
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                color: const Color(0xff78FF85),
                child: const Text('이건 컨테이너 테스트2', style: TextStyle(color: Colors.black),),
                width: 200,
                height: 100,
              ),
            ),



            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
              color: const Color(0xff78FFB5),
              child: const Text('이건 컨테이너 테스트3', style: TextStyle(color: Colors.black),),
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
