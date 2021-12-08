import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pic_api.dart';
import 'package:http/http.dart' as http;

class PixaBay extends StatefulWidget {
  const PixaBay({Key? key, required this.searching}) : super(key: key);
  final String searching;

  @override
  _PixaBayState createState() => _PixaBayState();
}

class _PixaBayState extends State<PixaBay> {
  Pixa? _pixaresult;
  final List<Hits> _list = [];
  var _result = '';
  int page = 1;
  int limit = 20;
  static const baseUrl = 'https://pixabay.com/api/';
  var key = '17828481-17c071c7f8eadf406822fada3';

  String _UrlAdd(String a, String b, String c) {
    return '$a?key=$b&q=$c&image_type=photo';
  }

  Future<Pixa> fetchList() async {
    final response =
    await http.get(Uri.parse(_UrlAdd(baseUrl, key, widget.searching)));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Pixa pixa = Pixa.fromJson(jsonResponse);
    // List<Hits> hitss = hits.map((e) => Hits.fromJson(e)).toList();
    return pixa;

    // Iterable jsonResponse =  jsonDecode(response.body);
    // List<Hits> hits = jsonResponse.map((e) => Hits.fromJson(e)).toList();
    // return hits;
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    Pixa pixa = await fetchList();

    setState(() {
      _pixaresult = pixa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_to_home_screen),
          onPressed:(){
            // _changMessage,
            Navigator.pop(context);}
      ),
      appBar: AppBar(
        title: Text(
          _result,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),
        ),
      ),
      body: SizedBox(
        child: ListView.separated(
          itemCount: _pixaresult != null ? _pixaresult!.hits.length : 0,
          itemBuilder: (context, index) {
            final data = _pixaresult!.hits[index];
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 300.0,
                    height: 160.0,
                    child: Image.network(
                      data.previewURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(data.tags),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 6.0);
          },
        ),
      ),
    );
  }
}