import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:exercise/Pixabay/http.dart';

import '../main.dart';

class PixaBaybay extends StatelessWidget {
  const PixaBaybay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubwayApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ), //외부의 디자인 테마.
      home: const Subway(title: 'Seoul Metro Guide'),
      //  const Subway(),
    );
  }
}


class Subway extends StatefulWidget {
  const Subway({Key? key, required this.title}) : super(key: key);
  final String title;

  // const Subway(this.title);


  @override
  _SubwayState createState() => _SubwayState();
}

class _SubwayState extends State<Subway> {
  // Server server = Server();
  // late final String sub = server.get();
  String _message = 'Pixabay 사진';
  int _counter = 0;

  final _picControl = TextEditingController();

  @override
  void dispose() {
    _picControl.dispose();
    super.dispose();
  }

  void _changMessage() {
    setState(() {
      _message = '하이 형섭';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed:(){
        // _changMessage,
        Navigator.push(context, MaterialPageRoute(builder: (context) => Myexer('주문을 받아오세요.','')));}
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            letterSpacing: 2.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
        // Center( //세로 축으로 가운데 위치.
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //가로축으로 가운데 위치(center).
            children: <Widget>[
              Text(_message,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/subway.png'),
                    radius: 50.0,
                  ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[850],
                thickness: 0.5,
                endIndent: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '사진검색',
                  ),
                  controller: _picControl,
                  keyboardType: TextInputType.text,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PixaBay(searching : _picControl.text)
                        ),
                      );
                    },
                    child: const Text('사진을봅시다.'),
                  ),
                ],
              ),
              const SizedBox(height: 50.0,),
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.add_to_home_screen,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    '$_counter',
                    style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                'sub',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
