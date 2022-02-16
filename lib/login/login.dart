import 'package:exercise/Dice/dice_game.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  String genresult = '';
  final time = DateTime.now();

  void gologin() {
    if (textController1.text == 'lhs' && textController2.text == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DiceGame(),
        ),
      );
    } else {
      setState(() {
        genresult = '아뒤 비번 확인하시오';
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                    width: 170.0,
                    height: 170.0,
                    child: Image.network(
                        'https://c.tenor.com/bSA0VUbzTPYAAAAC/come-here-finger-sign.gif')),
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0,
                    ))),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          controller: textController1,
                          decoration:
                              InputDecoration(labelText: 'Enter "ID"'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          controller: textController2,
                          decoration:
                              InputDecoration(labelText: 'Enter "Password"'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
                          child: ButtonTheme(
                            child: MaterialButton(
                              minWidth: 100.0,
                              height: 80.0,
                              onPressed: () {
                                gologin();
                              },
                              color: Colors.deepOrange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Go go!!',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          child: Text(genresult),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                        ),
                        Text('$time'),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('비반확인');
  }
}
