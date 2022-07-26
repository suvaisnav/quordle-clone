import 'dart:core';

import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quordle/game_page.dart';

import 'custom_text_field.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

_loadAsset(BuildContext context) async{
  String standard= await rootBundle.loadString('assets/words.txt');
  List<String> standardStrings=standard.split("\r\n");
  final _random = new Random();
  String test = standardStrings[_random.nextInt(standardStrings.length)];
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => GamePage(testString: test,)),
  );
  return GamePage(testString:test);
}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
          child: Text("Play", style: TextStyle(fontSize: 20),),
          onPressed: (){
            _loadAsset(context);
          },
          color: Colors.red,
          textColor: Colors.yellow,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.grey,


        ),
      );


  }
}

