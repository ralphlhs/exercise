import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exercise/Pixabay/pixabay.dart';
import 'package:exercise/snack_bar.dart';
import 'package:flutter/material.dart';
import 'column_test.dart';
import 'drawer_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Builder(
        builder: (context) => Myexer('a', 'b'),
      ),
      title: '연습',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '_',
      routes: {
        '_': (context) => Myexer('주문을 받아오세요.', ''),
      },
      // home: const Myexer('주문을 받아오세요.',''),
    );
  }
}

// StatelessWidget( key).build(BuildContext a);
//
// Widget abc(){
//   return const Scaffold();
// }



class Myexer extends StatefulWidget {
  Myexer(this.a, this.b, {Key? key}) : super(key: key);
  String a = '';
  String b = '';

  @override
  _MyexerState createState() => _MyexerState();
}

class _MyexerState extends State<Myexer> {
  final _drawerTest = const DrawerTest();
  final _snackTest = const SnackTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플러터 연습'),
        centerTitle: true,
        backgroundColor: const Color(0xff4282B4),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('쇼핑카트');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              const PixaBaybay();
              print('검색');
            },
          ),
        ],
      ),
      drawer: _drawerTest,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Center(
            child: Builder(builder: (BuildContext cont) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(cont).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '이게 스넥바라는 거야.',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.amber,
                    ),
                  );
                },
                child: const Text("눌러봐바. 뿅"),
              );
            },),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ColumnTest(widget.a, widget.b),
        ]),
      ),
    );
  }
}
