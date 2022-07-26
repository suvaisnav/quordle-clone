import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quordle/scores_page.dart';

import 'custom_text_field.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.testString}) : super(key: key);


  final String testString;


  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  int ind=0;


  late final List<List<TextEditingController>> _fields=List.generate(7, (i) => List.generate(5, (j) =>TextEditingController()) );

  late List<List<bool>> _fillColors=List.generate(7, (i) => List.generate(5, (j) =>false) );
  List<bool> selection=[true,false,false,false,false,false,false];
  List<bool> enable=[true,false,false,false,false,false,false];
  late List<List<Color>> _fillingColors=List.generate(7, (i) => List.generate(5, (j) =>Colors.orange) );





  void _submit()async {
    String standard= await rootBundle.loadString('assets/words.txt');
    List<String> standard_list=standard.split("\r\n");


    setState(()  {
      int res=0;


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
        if(widget.testString.contains(x[i]))
        {
          _fillColors[ind][i]=true;

          if(widget.testString[i]==x[i])
          {
            _fillingColors[ind][i]=Colors.green;
            res++;
          }
          else{
            _fillingColors[ind][i]=Colors.orange;

          }
        }

      }
      if(res==5)
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScoresPage(score: 50,answer: widget.testString,)),
          );
        }
      else if(ind==6){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScoresPage(score: 0,answer: widget.testString,)),
        );

      }
      if(ind<6) {
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

        title: Text("wordle"),
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
                ),
                Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SizedBox(

                      width: 50,

                      child: CustomTextField(
                        enable: enable[2],
                        field: _fields[2][0],
                        fillColor: _fillColors[2][0],
                        color: _fillingColors[2][0],
                        selection: selection[2],
                      ),
                    ),


                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[2],
                        field: _fields[2][1],
                        fillColor: _fillColors[2][1],
                        color: _fillingColors[2][1],
                        selection: selection[2],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[2],
                        field: _fields[2][2],
                        fillColor: _fillColors[2][2],
                        color: _fillingColors[2][2],
                        selection: selection[2],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[2],
                        field: _fields[2][3],
                        fillColor: _fillColors[2][3],
                        color: _fillingColors[2][3],
                        selection: selection[2],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[2],
                        field: _fields[2][4],
                        fillColor: _fillColors[2][4],
                        color: _fillingColors[2][4],
                        selection: selection[2],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SizedBox(

                      width: 50,

                      child: CustomTextField(
                        enable: enable[3],
                        field: _fields[3][0],
                        fillColor: _fillColors[3][0],
                        color: _fillingColors[3][0],
                        selection: selection[3],
                      ),
                    ),


                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[3],
                        field: _fields[3][1],
                        fillColor: _fillColors[3][1],
                        color: _fillingColors[3][1],
                        selection: selection[3],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[3],
                        field: _fields[3][2],
                        fillColor: _fillColors[3][2],
                        color: _fillingColors[3][2],
                        selection: selection[3],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[3],
                        field: _fields[3][3],
                        fillColor: _fillColors[3][3],
                        color: _fillingColors[3][3],
                        selection: selection[3],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[3],
                        field: _fields[3][4],
                        fillColor: _fillColors[3][4],
                        color: _fillingColors[3][4],
                        selection: selection[3],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SizedBox(

                      width: 50,

                      child: CustomTextField(
                        enable: enable[4],
                        field: _fields[4][0],
                        fillColor: _fillColors[4][0],
                        color: _fillingColors[4][0],
                        selection: selection[4],
                      ),
                    ),


                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[4],
                        field: _fields[4][1],
                        fillColor: _fillColors[4][1],
                        color: _fillingColors[4][1],
                        selection: selection[4],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[4],
                        field: _fields[4][2],
                        fillColor: _fillColors[4][2],
                        color: _fillingColors[4][2],
                        selection: selection[4],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[4],
                        field: _fields[4][3],
                        fillColor: _fillColors[4][3],
                        color: _fillingColors[4][3],
                        selection: selection[4],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[4],
                        field: _fields[4][4],
                        fillColor: _fillColors[4][4],
                        color: _fillingColors[4][4],
                        selection: selection[4],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SizedBox(

                      width: 50,

                      child: CustomTextField(
                        enable: enable[5],
                        field: _fields[5][0],
                        fillColor: _fillColors[5][0],
                        color: _fillingColors[5][0],
                        selection: selection[5],
                      ),
                    ),


                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[5],
                        field: _fields[5][1],
                        fillColor: _fillColors[5][1],
                        color: _fillingColors[5][1],
                        selection: selection[5],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[5],
                        field: _fields[5][2],
                        fillColor: _fillColors[5][2],
                        color: _fillingColors[5][2],
                        selection: selection[5],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[5],
                        field: _fields[5][3],
                        fillColor: _fillColors[5][3],
                        color: _fillingColors[5][3],
                        selection: selection[5],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[5],
                        field: _fields[5][4],
                        fillColor: _fillColors[5][4],
                        color: _fillingColors[5][4],
                        selection: selection[5],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SizedBox(

                      width: 50,

                      child: CustomTextField(
                        enable: enable[6],
                        field: _fields[6][0],
                        fillColor: _fillColors[6][0],
                        color: _fillingColors[6][0],
                        selection: selection[6],
                      ),
                    ),


                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[6],
                        field: _fields[6][1],
                        fillColor: _fillColors[6][1],
                        color: _fillingColors[6][1],
                        selection: selection[6],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[6],
                        field: _fields[6][2],
                        fillColor: _fillColors[6][2],
                        color: _fillingColors[6][2],
                        selection: selection[6],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: CustomTextField(
                        enable: enable[6],
                        field: _fields[6][3],
                        fillColor: _fillColors[6][3],
                        color: _fillingColors[6][3],
                        selection: selection[6],
                      ),
                    ),

                    SizedBox(

                      width: 50,
                      child: TextField(
                        enabled: enable[6],
                        enableInteractiveSelection: selection[6],
                        keyboardType: TextInputType.text ,
                        controller: _fields[6][4],
                        maxLength: 1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        onChanged: (String value) async {


                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                          return;
                        },
                        decoration: InputDecoration(
                          filled: _fillColors[6][4],
                          fillColor: _fillingColors[6][4],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
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
