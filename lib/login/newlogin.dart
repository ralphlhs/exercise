import 'package:flutter/material.dart';



class NewLogin extends StatelessWidget {
  String aaaa = 'asdfadf';
  String? aaa;





  NewLogin({Key? key}) : super(key: key);


  Future <String> getString() async {
    // String a = '이것은 b올시다.';
    String b = await aaaa;
    return b;
  }

  void _getSt() async {
    aaa = await getString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로깅'),
        centerTitle: true,
      ),
      body: button(),

    );
  }


  Widget button() {
    return Column(
        children: [
          Text(aaa!),
        ],
      );
  }

}

