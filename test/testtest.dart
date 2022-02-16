import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  List<int> a = lottoNum();
  List<int> b = myNum();
  print(a);
  print(b);
  // compare(a, b);

  // for(String z in carbrand){
  //   print(z);
  // }
}

List <int> lottoNum() {
  var ran = Random();
  List<int> lottolist = [];
  int random;
  for (int i = 0; i < 6; i++) {
    random = ran.nextInt(45) + 1;
    lottolist.add(random);
  }
  print('로또 리스트');
  print(lottolist);
  return lottolist;
}

List <int> myNum(){
  List <int> mylottoList = [];
  int random1;
  for(int i = 0; i < 6; i++){
    random1 = Random().nextInt(45) + 1;
    mylottoList.add(random1);
  }
  return mylottoList;
}


void compare(a, b){
  for(int aa in a){

    for(int bb in b){
      print('로또번호 = $aa');
      print('로또번호 = $bb');
    }
  }
}

List<String> carbrand = ['benz', 'audi', 'Hyungdai', 'bmw'];