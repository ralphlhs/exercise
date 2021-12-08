import 'package:flutter/material.dart';

class SecondTest extends StatelessWidget {
  const SecondTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이건 두번째'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
          color: const Color(0xff78FFB5),
          child: const Text('이건 컨테이너 테스트1'),
          width: 200,
          height: 100,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
          color: const Color(0xff78FFB5),
          child: const Text('이건 컨테이너 테스트2'),
          width: 200,
          height: 100,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('이걸눌러봐.'),
        )
      ]),
    );
  }
}

