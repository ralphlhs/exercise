import 'package:flutter/material.dart';
import 'dart:math';

import '../main.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {

  @override
    void dispose() {
      super.dispose();
      print('dispose is called');
    }

  int? scores1;
  int? scores2;
  int? add1_2;
  String? diceNum1;
  String? diceNum2;

  int grade1() {
    int score = Random().nextInt(6) + 1;
    return score;
  }

  int grade2() {
    int scoree = Random().nextInt(6) + 1;
    return scoree;
  }

  int? grade3() {
    int hap = grade1() + grade2();
    return hap;
  }

  String? diceType1() {
    String dices = '';
    switch (scores1) {
      case 1:
        dices = 'images/dice1.gif';
        break;
      case 2:
        dices = 'images/dice2.gif';
        break;
      case 3:
        dices = 'images/dice3.gif';
        break;
      case 4:
        dices = 'images/dice4.gif';
        break;
      case 5:
        dices = 'images/dice5.gif';
        break;
      default:
        dices = 'images/dice6.gif';
        break;
    }
    return dices;
  }

  String? diceType2() {
    String dicess = '';
    switch (scores2) {
      case 1:
        dicess = 'images/dice1.gif';
        break;
      case 2:
        dicess = 'images/dice2.gif';
        break;
      case 3:
        dicess = 'images/dice3.gif';
        break;
      case 4:
        dicess = 'images/dice4.gif';
        break;
      case 5:
        dicess = 'images/dice5.gif';
        break;
      default:
        dicess = 'images/dice6.gif';
        break;
    }
    return dicess;
  }

  @override
  void initState() {
    // TODO: implement initState
    gradeto();
    // diceType();
    super.initState();
    print('initState is called');
  }

  void gradeto() {
    setState(() {
      scores1 = grade1();
      diceNum1 = diceType1();
      scores2 = grade2();
      diceNum2 = diceType2();
      add1_2 = grade1() + grade2();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build is called');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_to_home_screen),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Myexer('이건 컨테이너 테스트1', ''),
              ),
            );
          }),
      appBar: AppBar(
        title: const Text(
          'Dice Game',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
              child: MaterialButton(
                minWidth: 150.0,
                height: 70.0,
                color: Colors.cyan,
                onPressed: () {
                  gradeto();
                },
                child: const Text("주사위 던져!"),
              ),
            ),
            SizedBox(
                width: 150.0,
                height: 150.0,
                child: Image.network(
                    'https://thumbs.gfycat.com/CheapExaltedIcefish-size_restricted.gif')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image(image: AssetImage(diceNum1!))),
                SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image(image: AssetImage(diceNum2!))),
              ],
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    scores1.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    width: 200.0,
                  ),
                  Text(
                    scores2.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: Text(
                '그래서 합은 :  ${add1_2.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
// child: Row(
// children: [
// Expanded(child: Image.asset(diceNum1!)),
// const SizedBox(
// width: 20.0,
// ),
// Expanded(child: Image.asset(diceNum2!)),
// ],
// ),
// ),
