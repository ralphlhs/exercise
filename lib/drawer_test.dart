import 'package:exercise/Pixabay/pixabay.dart';
import 'package:flutter/material.dart';
import 'Dice/dice_game.dart';
import 'FutureBuilder/future_test.dart';
import 'login/login.dart';
import 'Menu/dduck.dart';
import 'Memo/memo_main.dart';
import 'Subway/subway.dart';
import 'login/newlogin.dart';

class DrawerTest extends StatelessWidget {
  const DrawerTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/subway.gif'),
              backgroundColor: Color(0xffcd8d8d),
            ),
            otherAccountsPictures: const [
              CircleAvatar(
                // backgroundImage: AssetImage(
                //     'https://c.tenor.com/jUg2am4740MAAAAM/emoji-tear.gif'),
                backgroundColor: Colors.amberAccent,
              ),
            ],
            accountName: const Text('poohlee'),
            accountEmail: const Text('ralphlhs@empas.com'),
            onDetailsPressed: () {
              Navigator.push( context,
              MaterialPageRoute(builder: (context) => const Login()),
              );
              print('arrow is clicked');
            },
            decoration: const BoxDecoration(
              color: Color(0xffE5996F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('Pixabay 사진보기',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (anything) => const PixaBaybay()));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_call,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('떡볶이 주문',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Dduck()));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.airport_shuttle,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('지하철이 옵니다.',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const SubWay()));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.article_outlined,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('메모를 해봅시다.',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TodoListPage(a: '콜라', b: 23, mack: Mac('매킨토시'),)));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.view_in_ar,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('주사위 던지기',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DiceGame() ));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_road,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('퓨쳐 핸썹',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Waiting() ));
            },
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

