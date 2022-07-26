import 'dart:core';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;

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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String test="apple";
  int ind=0;

  late final List<List<TextEditingController>> _fields=List.generate(2, (i) => List.generate(5, (j) =>TextEditingController()) );

  late List<List<bool>> _fillColors=List.generate(2, (i) => List.generate(5, (j) =>false) );
  List<bool> selection=[true,false];
  List<bool> enable=[true,false];
  late List<List<Color>> _fillingColors=List.generate(2, (i) => List.generate(5, (j) =>Colors.orange) );

  void _submit()async {
    String standard= await rootBundle.loadString('assets/words.txt');
    List<String> standard_list=standard.split("\r\n");


    setState(()  {

      String x=_fields[ind][0].text+_fields[ind][1].text+_fields[ind][2].text+_fields[ind][3].text+_fields[ind][4].text;
      if(!(standard_list.contains(x)))
        {
          for(int j=0;j<5;j++) {
            _fields[ind][j].clear();
          }
          return;
        }
      for(int i=0;i<5;i++)
        {
          selection[ind]=false;
          enable[ind]=false;
          if(test.contains(x[i]))
            {
              _fillColors[ind][i]=true;

              if(test[i]==x[i])
                {
                  _fillingColors[ind][i]=Colors.green;
                }
              else{
                _fillingColors[ind][i]=Colors.orange;

              }
            }

        }
      if(ind<1) {
        ind++;
        print(ind);
        selection[ind] = true;
        enable[ind] = true;
      }
    });


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  <Widget>[
              SizedBox(

                width: 50,

                  child: CustomTextField(
                    enable: enable[0],
                    field: _fields[0][0],
                    fillColor: _fillColors[0][0],
                    color: _fillingColors[0][0],
                    selection: selection[0],
                     ),
                ),


              SizedBox(

                width: 50,
                child: CustomTextField(
                  enable: enable[0],
                  field: _fields[0][1],
                  fillColor: _fillColors[0][1],
                  color: _fillingColors[0][1],
                  selection: selection[0],
                ),
              ),

              SizedBox(

                width: 50,
                child: CustomTextField(
                  enable: enable[0],
                  field: _fields[0][2],
                  fillColor: _fillColors[0][2],
                  color: _fillingColors[0][2],
                  selection: selection[0],
                ),
              ),

              SizedBox(

                width: 50,
                child: CustomTextField(
                  enable: enable[0],
                  field: _fields[0][3],
                  fillColor: _fillColors[0][3],
                  color: _fillingColors[0][3],
                  selection: selection[0],
                ),
              ),

              SizedBox(

                width: 50,
                child: CustomTextField(
                  enable: enable[0],
                  field: _fields[0][4],
                  fillColor: _fillColors[0][4],
                  color: _fillingColors[0][4],
                  selection: selection[0],
                ),
              ),
            ],
    ),    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                SizedBox(

                  width: 50,

                  child: CustomTextField(
                    enable: enable[1],
                    field: _fields[1][0],
                    fillColor: _fillColors[1][0],
                    color: _fillingColors[1][0],
                    selection: selection[1],
                  ),
                ),


                SizedBox(

                  width: 50,
                  child: CustomTextField(
                    enable: enable[1],
                    field: _fields[1][1],
                    fillColor: _fillColors[1][1],
                    color: _fillingColors[1][1],
                    selection: selection[1],
                  ),
                ),

                SizedBox(

                  width: 50,
                  child: CustomTextField(
                    enable: enable[1],
                    field: _fields[1][2],
                    fillColor: _fillColors[1][2],
                    color: _fillingColors[1][2],
                    selection: selection[1],
                  ),
                ),

                SizedBox(

                  width: 50,
                  child: CustomTextField(
                    enable: enable[1],
                    field: _fields[1][3],
                    fillColor: _fillColors[1][3],
                    color: _fillingColors[1][3],
                    selection: selection[1],
                  ),
                ),

                SizedBox(

                  width: 50,
                  child: CustomTextField(
                    enable: enable[1],
                    field: _fields[1][4],
                    fillColor: _fillColors[1][4],
                    color: _fillingColors[1][4],
                    selection: selection[1],
                  ),
                ),
              ],
            ),
          RaisedButton(
            child: Text("Submit", style: TextStyle(fontSize: 20),),
            onPressed: _submit,
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,


      )
          ]
      )




        ),


    );
  }


}
