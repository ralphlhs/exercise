import 'package:flutter/material.dart';
import 'ChatChat/screens/chat_home_screen.dart';
import 'Dice/dice_game.dart';
import 'login/login.dart';
import 'Memo/memo_main.dart';

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
              backgroundImage: AssetImage('assets/subway.gif'),
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
              Navigator.push(
                context,
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
            title: const Text("Let's talk",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (anything) => ChatHomeScreen()));
            },
            trailing: const Icon(Icons.add),
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.add_call,
          //     color: Color(0xff5F5F5F),
          //   ),
          //   title: const Text('????????? ??????',
          //       style: TextStyle(
          //           fontSize: 17.0,
          //           color: Color(0xff5F5F5F),
          //           fontWeight: FontWeight.bold)),
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const Dduck()));
          //   },
          //   trailing: const Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.airport_shuttle,
          //     color: Color(0xff5F5F5F),
          //   ),
          //   title: const Text('???????????? ?????????.',
          //       style: TextStyle(
          //           fontSize: 17.0,
          //           color: Color(0xff5F5F5F),
          //           fontWeight: FontWeight.bold)),
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const SubWay()));
          //   },
          //   trailing: const Icon(Icons.add),
          // ),
          ListTile(
            leading: const Icon(
              Icons.article_outlined,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('????????? ????????????.',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TodoListPage(
                            a: '?????????',
                            b: 23,
                            mack: Mac('????????????'),
                          )));
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: const Icon(
              Icons.view_in_ar,
              color: Color(0xff5F5F5F),
            ),
            title: const Text('????????? ????????? ??????',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5F5F5F),
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DiceGame()));
            },
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
