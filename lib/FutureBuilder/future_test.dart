import 'dart:io';

import 'package:flutter/material.dart';

class Waiting extends StatelessWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Future Test'),
      ),
      body: Column(children: [
        const Text('이건 일단 먼저 시행'),
        FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return Column(
                  children: [
                    const CircularProgressIndicator(),
                    Text(snapshot.data.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('에러 : ${snapshot.error}'),
                );
              } else {
                return   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data!.toString()),
                  );
              }
            }),
      ]),
    );
  }

  Future<String> _fetchData() async {
    await Future.delayed(
      const Duration(seconds: 3)
    );
    return '데이터 잘가져왔어요~';
  }
}

// Future<String> _fetchData() async {
//   await Future.delayed(const Duration(seconds: 3));
//   return 'Data 잘가져왔음.';
// }
//
//
//
// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// '이곳은 데이터 상관없이 불려져 오는 곳입니다.',
// style: TextStyle(fontSize: 20),
// ),
// const SizedBox(
// height: 20.0,
// ),
// FutureBuilder(
// future: _fetchData(),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
// if (snapshot.hasData == false) {
// return const CircularProgressIndicator();
// }
// //error가 발생하게 될 경우 반환하게 되는 부분
// else if (snapshot.hasError) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'Error: ${snapshot.error}',
// style: const TextStyle(fontSize: 15),
// ),
// );
// }
// // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
// else {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// snapshot.data.toString(),
// style: const TextStyle(
// fontSize: 16.0, fontWeight: FontWeight.w200),
// ));
// }
// },
// ),
// ],
// ),
// ),
