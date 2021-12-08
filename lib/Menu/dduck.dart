import 'package:exercise/Pixabay/kim_heaven.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class Dduck extends StatefulWidget {
  const Dduck({Key? key}) : super(key: key);

  @override
  State<Dduck> createState() => _DduckState();
}

class _DduckState extends State<Dduck> {
  // String url = 'http://jsonplaceholder.typicode.com/todos';
  String url = 'https://extrasmallsourextension.ralphlhs71.repl.co/json.html';
  List<Map<String, dynamic>>
  // jfk = [];
  jfk = [{ "_menu": '15,000원', "_col": '공기밥 무료', "_dodo": 0xffFFE959 }, { "_menu": '7,000원', "_col": '공기밥 천원', "_dodo": 0xffB2FF59 }, { "_menu": '3,500원', "_col": '김치 셀프', "_dodo": 0xffAD6BB3 }];
  Map<String, dynamic> af = {};

  Future<List <Map<String, dynamic>>> KimHeaven() async {
    final response =
    await http.get(Uri.parse(url));
    var jjj = response.body;
    print(jjj);
    List <Map<String, dynamic>> jj = jsonDecode(jjj)!;
    List <Map<String, dynamic>> jfk = Post.fromJson(jj).getList().toList();
    return jfk;



    // print(response.body);
    // print(response.statusCode);
    // var jjj = jsonDecode(response.body);
    // print(jjj.toString());

    // if (response.statusCode == 200) {
    //   return jjj.map((post) => Post.fromJson(post)).toList();
    // }
    // throw ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text(
    //       '통신이 안됩니다.',
    //       textAlign: TextAlign.center,
    //     ),
    //     backgroundColor: Colors.amber,
    //   ),
    // );
    // Exception('통신이 안됩니다.');
  }

  @override
  void initState() {
    super.initState();
    init();
    // KimHeaven();
  }

  // Future<void> init() async {
  //
  //   http.get(Uri.parse(url)).then((response){
  //     print(response.statusCode);
  //     print(response.body);
  //     String zzz = response.body;
  //     List<Map<String, dynamic>> jjj = convert.jsonDecode(zzz);
  //     jfk = jjj;
  //   });}

  Future<void> init() async {
    List<Map<String, dynamic>> jjjj = await KimHeaven();
    setState(() {

      jfk = jjjj;
    });
  }

  String _menu = '궁금해?';
  String _col = '추가?';
  int _dodo = 0xffffffff;

  void _squid() async {
    setState(() {
      Map<String, dynamic> json = jfk[0];
      _menu = Pizza.fromJson(json).getMenuPrice().toString();
      _col = Pizza.fromJson(json).getAdd().toString();
      _dodo = Pizza.fromJson(json).getColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Text(
            '주문\n완료',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onPressed: () {
            // _changMessage,
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Myexer('주문 : $_menu', '추가내용 : $_col')));
          }),
      appBar: AppBar(
        title: const Text('김밥천국'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _squid();
                  },
                  child: const Text('오징어볶음'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // List<dynamic> jjjj = await KimHeaven();
                    setState(() {
                      Map<String, dynamic> json = jfk[1];
                      _menu = Pizza.fromJson(json).getMenuPrice().toString();
                      _col = Pizza.fromJson(json).getAdd().toString();
                      _dodo = Pizza.fromJson(json).getColor();
                    });
                  },
                  child: const Text('떡볶이'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // List<dynamic> jjjj = await KimHeaven();
                    setState(() {
                      Map<String, dynamic> json = jfk[2];
                      _menu = Pizza.fromJson(json).getMenuPrice();
                      _col = Pizza.fromJson(json).getAdd();
                      _dodo = Pizza.fromJson(json).getColor();
                    });
                  },
                  child: const Text('김밥'),
                ),
                ElevatedButton(
                  onPressed: () {
                    http.get(Uri.parse(url)).then((response) {
                      print(response.statusCode);
                      print(response.body);
                    });
                  },
                  child: const Text('김밥 통신'),
                ),
              ],
            ),
            Squided(_menu, _col, _dodo),
          ],
        ),
      ),
    );
  }
}

abstract class Pizza {
  String getMenuPrice();

  String getAdd();

  int getColor();

  factory Pizza.fromJson(Map<String, dynamic> json) {
    switch (json["_menu"] as String) {
      case '15,000원':
        return Dduk(json["_menu"] as String, json["_col"] as String,
            json["_dodo"] as int);

      case '6,000원':
        return Roll(json["_menu"] as String, json["_col"] as String,
            json["_dodo"] as int);

      default:
        return Squid(json["_menu"] as String, json["_col"] as String,
            json["_dodo"] as int);
    }
  }
}

class Dduk implements Pizza {
  Dduk(this._menu, this._col, this._dodo);

  final String _menu;

  final String _col;
  final int _dodo;

  @override
  String getMenuPrice() {
    return _menu;
  }

  @override
  String getAdd() {
    return _col;
  }

  @override
  int getColor() {
    return _dodo;
  }
}

class Roll implements Pizza {
  Roll(this._menu, this._col, this._dodo);

  final String _menu;
  final String _col;
  final int _dodo;

  @override
  String getMenuPrice() {
    return _menu;
  }

  @override
  String getAdd() {
    return _col;
  }

  @override
  int getColor() {
    return _dodo;
  }
}

class Squid implements Pizza {
  Squid(this._menu, this._col, this._dodo);

  final String _menu;
  final String _col;
  final int _dodo;

  @override
  String getMenuPrice() {
    return _menu;
  }

  @override
  String getAdd() {
    return _col;
  }

  @override
  int getColor() {
    return _dodo;
  }
}

class Squided extends StatelessWidget {
  final String menu;
  final String col;
  final int dodo;

  Squided(this.menu, this.col, this.dodo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 150.0, 0, 0),
      color: Color(dodo),
      child: Text(
        '$menu\n\n$col',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
      width: 200,
      height: 110,
    );
  }
}
