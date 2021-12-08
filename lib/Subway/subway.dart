import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const _API_METRO = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/%EA%B0%95%EB%82%A8";

class SubWay extends StatefulWidget {
  const SubWay({Key? key}) : super(key: key);

  @override
  State<SubWay> createState() => _SubWayState();
}

class _SubWayState extends State<SubWay> {
  MetroInfo? _metroinfo;
  String subwayName = '모란';
  final _picControl = TextEditingController();

  Future<MetroInfo> metroInfo() async {
    String _API_METRO =
        'http://swopenAPI.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$subwayName';
    final response = await http.get(Uri.parse(_API_METRO));
    // String metroinfofo = response.body;
    // print(metroinfofo);
    var decode = jsonDecode(response.body);
    MetroInfo metroinfofo = MetroInfo.fromJson(decode);
    return metroinfofo;
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _picControl.dispose();
    super.dispose();
  }

  Future<void> init() async {
    MetroInfo meme = await metroInfo();
    setState(() {
      _metroinfo = meme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 역정보'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  subwayName = _picControl.text;
                });
              },
              child: const Text('지하철정보'),
            ),
          ]),
          SizedBox(
            child: ListView.separated(
              itemCount: _metroinfo != null
                  ? _metroinfo!.realtimeArrivalList.length
                  : 0,
              itemBuilder: (context, index) {
                final data = _metroinfo!.realtimeArrivalList[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 300.0,
                        height: 160.0,
                        child: Text(
                          data.updnLine,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(data.trainLineNm),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 6.0);
              },
            ),
          ),





        ],
      ),
    );
  }
}

class MetroInfo {
  // late Map<String, dynamic> errorMessage;
  late List<RealtimeArrivalList> realtimeArrivalList;

  MetroInfo(
      // this.errorMessage,
      this.realtimeArrivalList);

  MetroInfo.fromJson(dynamic jjj) {
    // errorMessage = {};
    // jjj["errorMessage"].forEach((_) {errorMessage.add(ErrorMessage.fromJson(_)});
    //
    realtimeArrivalList = [];
    jjj["realtimeArrivalList"].forEach((v) {
      realtimeArrivalList.add(RealtimeArrivalList.fromJson(v));
    });
  }
}

class ErrorMessage {
  late int status; //200
  late String message; //정상 or 에러

  ErrorMessage.fromJson(dynamic jj) {
    status = jj["status"];
    message = jj['message'];
  }
}

class RealtimeArrivalList {
  late String statnNm; //역이름
  late String updnLine; //상행
  late String trainLineNm; //방면
  late String subwayHeading; //오른쪽, 왼쪽
  late String arvlMsg2; //현재위치

  RealtimeArrivalList.fromJson(dynamic jj) {
    statnNm = jj["statnNm"];
    updnLine = jj["updnLine"];
    trainLineNm = jj["trainLineNm"];
    subwayHeading = jj["subwayHeading"];
    arvlMsg2 = jj["arvlMsg2"];
  }
}

// "realtimeArrivalList": [
// {
// "beginRow": null,
// "endRow": null,
// "curPage": null,
// "pageRow": null,
// "totalCount": 8,
// "rowNum": 1,
// "selectedCount": 5,
// "subwayId": "1008",
// "subwayNm": null,
// "updnLine": "상행",
// "trainLineNm": "암사행 - 수진방면",
// "subwayHeading": "오른쪽",
// "statnFid": "1008000826",
// "statnTid": "1008000825",
// "statnId": "1008000826",
// "statnNm": "모란",
// "trainCo": null,
// "ordkey": "01000암사0",
// "subwayList": "1008,1075",
// "statnList": "1008000826,1075075225",
// "btrainSttus": null,
// "barvlDt": "120",
// "btrainNo": "8136",
// "bstatnId": "1",
// "bstatnNm": "암사",
// "recptnDt": "2021-12-07 13:44:01.0",
// "arvlMsg2": "모란 도착",
// "arvlMsg3": "모란",
// "arvlCd": "1"
// },
//
// "errorMessage": {
// "status": 200,
// "code": "INFO-000",
// "message": "정상 처리되었습니다.",
// "link": "",
// "developerMessage": "",
// "total": 8
// },
