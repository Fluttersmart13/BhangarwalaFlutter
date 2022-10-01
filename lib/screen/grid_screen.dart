import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GridClass extends StatefulWidget{

  @override
  State<GridClass> createState() => _GridClassState();
}

class _GridClassState extends State<GridClass> {
  bool visibilityCheckApprovel = true;
  List<Choice> choices =  <Choice>[
     Choice(title: 'A', isSelected:false),
     Choice(title: 'B', isSelected:false),
     Choice(title: 'C', isSelected:false),
     Choice(title: 'D', isSelected:false),
     Choice(title: 'E', isSelected:false),
     Choice(title: 'F', isSelected:false),
     Choice(title: 'G', isSelected:false),
     Choice(title: 'H', isSelected:false),
     Choice(title: 'A', isSelected:false),
     Choice(title: 'B', isSelected:false),
     Choice(title: 'C', isSelected:false),
     Choice(title: 'D', isSelected:false),
     Choice(title: 'E', isSelected:false),
     Choice(title: 'F', isSelected:false),
     Choice(title: 'G', isSelected:false),
     Choice(title: 'H', isSelected:false),
  ];
  int counter = 0;
  Queue<int> selcted = new Queue<int>();
  String ismatch = "";
  late SharedPreferences prefs;
  int attempt = 0;
  int completed = 0;

  @override
  void initState() {
    super.initState();
    _lodaSharedPreference();
    _shuffleList();

  }

  _lodaSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      attempt = prefs.getInt('attempt') ?? 0;
      completed = prefs.getInt('completed') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(appBar: AppBar(
          title: Text("Game App"),
        ),
            body: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: color1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" No of attempts : ${attempt}",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("Matches completed : ${completed} ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                (ismatch == "Card match")?Text(ismatch,style: TextStyle(color: color1,fontSize: 20,fontWeight: FontWeight.bold),):Text(ismatch,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height - 50,
                    child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(choices.length, (index) {
                          return Center(
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  if(!selcted.toList().contains(index)){
                                    counter = counter+1;
                                    choices[index].isSelected = true;
                                    if(counter == 3){
                                      selcted.clear();
                                      selcted.addFirst(index);
                                      counter = 1;
                                    }else{
                                      selcted.addFirst(index);
                                      if(selcted.length > 2){
                                        selcted.removeLast();
                                      }
                                    }
                                  }

                                  if(selcted.toList().length == 2){
                                    attempt = attempt +1;
                                    if((choices[selcted.toList()[0]].title == (choices[selcted.toList()[1]].title))){
                                      ismatch = "Card match";
                                      completed = completed+1;
                                    }else{
                                      ismatch = "Card not match";
                                    }

                                    prefs.setInt("attempt", attempt);
                                    prefs.setInt("completed", completed);
                                  }else{
                                    ismatch = "";
                                  }
                                });
                              },
                              child: Card(
                                  color: selcted.toList().contains(index) ? color1 : color2,
                                  child: Center(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        selcted.toList().contains(index) ? Text(choices[index].title.toString(), style: TextStyle(fontSize: 20,color: Colors.white)):Text(""),
                                      ]
                                  ),
                                  )
                              ),
                            ),
                          );
                        })
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }

  void _shuffleList() {
    choices.shuffle();
  }
}
class Choice {
  Choice({required this.title, required this.isSelected});
  final String title;
  bool isSelected;
}