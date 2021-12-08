import 'package:exercise/Pixabay/pixabay.dart';
import 'package:exercise/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'column_test.dart';
import 'drawer_test.dart';

void main() {
  runApp(const MyApp());
  Spicy(a: '에이요~');

  print(Spicy().aaa());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (context) => Myexer('a', 'b'),),
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

class Spicy {
  String? a;
  int b = 10;

  Spicy({String a = ''}) {
    print('이거슨...$a');
  }

  String? aaa() {
    return a;
  }
}

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
      body: ColumnTest(widget.a, widget.b),
    );
  }
}
