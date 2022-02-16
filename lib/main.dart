import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exercise/Pixabay/pixabay.dart';
import 'package:exercise/snack_bar.dart';
import 'package:flutter/material.dart';
import 'column_test.dart';
import 'drawer_test.dart';
import 'login/login.dart';

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
      title: 'HS chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '_',
      routes: {
        '_': (context) => Myexer('주문을 받아오세요.', ''),
      },
    );
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
        // title: const Text('HS chat !'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // elevation: 0.0,
        // Color.fromRGBO(0, 0, 0, 90.0),
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
      body:const Login(),



    );
  }
}
