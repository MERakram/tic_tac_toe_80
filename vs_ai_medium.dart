import 'package:flutter/material.dart';

import 'difficulty_screen.dart';
import 'game_button.dart';


class vs_ai_medium extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<vs_ai_medium> {
  final title = 'Grid List';

  var player1 = [];
  var player2 = [];
  String gamestr = 'GO';

  late bool gameisdone;

  List listButton = <GameButton>[
    new GameButton(1),
    new GameButton(2),
    new GameButton(3),
    new GameButton(4),
    new GameButton(5),
    new GameButton(6),
    new GameButton(7),
    new GameButton(8),
    new GameButton(9)
  ];
  int I1=0;
  int I2=0;
  Future<void> wait() {
    return Future.delayed(const Duration(seconds: 1), () =>setState(() {
      reset();
    }));
  }
  Future<void> waitpop() {
    return Future.delayed(const Duration(seconds: 1), () =>setState(() {
      createAlertDialog(context);
    }));
  }
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Congrats')),
            content:  Container(
              child: Center(
                child: Text(
                  gamestr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              width: 260.0,
              height: 50.0,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius:  BorderRadius.all(new Radius.circular(32.0)),
              ),
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                child: Text('reset'),
                onPressed: () {
                  setState(() {
                    reset();
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      listButton[i].str = '';
      listButton[i].enabled = true;
      listButton[i].clr =  Colors.white;
    }
    player1 = [];
    player2 = [];

    gamestr = "X $I1 - $I2 AI";
  }

  int checkWinner(var player) {
    if (player.contains(0) && player.contains(1) && player.contains(2)){ player1=[0,1,2];return 1;}

    if (player.contains(3) && player.contains(4) && player.contains(5)){player1=[3,4,5];return 2;}

    if (player.contains(6) && player.contains(7) && player.contains(8)){player1=[6,7,8];return 3;}

    if (player.contains(0) && player.contains(3) && player.contains(6)){player1=[0,3,6];return 4;}

    if (player.contains(1) && player.contains(4) && player.contains(7)){ player1=[1,4,7];return 5;}

    if (player.contains(2) && player.contains(5) && player.contains(8)){ player1=[2,5,8];return 6;}

    if (player.contains(0) && player.contains(4) && player.contains(8)){player1=[0,4,8];return 7;}

    if (player.contains(2) && player.contains(4) && player.contains(6)){ player1=[2,4,6];return 8;}


    return 0;
  }



  void playGame(int index) {
    // player 1
    if (listButton[index].enabled) {
      listButton[index].str = 'X';
      listButton[index].enabled = false;
      listButton[index].clr = Colors.red;
      player1.add(index);
    }
    gameisdone = true;
    //check if the game ended
    for (int i = 0; i <= 8; i++) {
      if (listButton[i].enabled) {
        gameisdone = false;
      }
    }
    if (gameisdone) {
      gamestr = 'DRAW';
      waitpop();
    }
// check if the game ended
//     for (int i = 0; i < 9; i++) {
//       if (listButton[i].enabled==false)
//         gameisdone = true;
//     }
//     if (gameisdone) {
//       gamestr='tie';
//
//     }
    if ( 1 <= checkWinner(player1)  && checkWinner(player1)  <= 8) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = const Color(0xFF397680FF);

      }

      I1++;
      gamestr = "X $I1 - $I2 AI";
      for (var element in player1) {   listButton[element].clr = Colors.green;}
      waitpop();

      return;
    }

    // player 2
    // make the game more clever
    // player 2
    int solution=0;


    var allPlayedButtons = new List.from(player1)..addAll(player2);
    if (player1.contains(0) && player1.contains(1) && !player2.contains(2) && solution==0 ){
      if (!allPlayedButtons.contains(2)) {
        listButton[2].str = 'O';
        listButton[2].enabled = false;
        listButton[2].clr = Colors.blue;
        player2.add(2);
        solution=solution+1;

      }
    } else if (player1.contains(3) && player1.contains(4) && !player2.contains(5) && solution==0  ) {
      if (!allPlayedButtons.contains(2)) {
        listButton[5].str = 'O';
        listButton[5].enabled = false;
        listButton[5].clr = Colors.blue;
        player2.add(5);
        solution=solution+1;
      }
    } else if (player1.contains(6) && player1.contains(7)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(2)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.blue;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(0) && player1.contains(3)&& !player2.contains(6) && solution==0 ) {
      if (!allPlayedButtons.contains(6)) {
        listButton[6].str = 'O';
        listButton[6].enabled = false;
        listButton[6].clr = Colors.blue;
        player2.add(6);
        solution=solution+1;
      }
    } else if (player1.contains(1) && player1.contains(4)&& !player2.contains(7) && solution==0 ) {
      if (!allPlayedButtons.contains(7)) {
        listButton[7].str = 'O';
        listButton[7].enabled = false;
        listButton[7].clr = Colors.blue;
        player2.add(7);
        solution=solution+1;
      }
    } else if (player1.contains(2) && player1.contains(5)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(8)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.blue;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(0) && player1.contains(4)&& !player2.contains(8) && solution==0 ) {
      if (!allPlayedButtons.contains(8)) {
        listButton[8].str = 'O';
        listButton[8].enabled = false;
        listButton[8].clr = Colors.blue;
        player2.add(8);
        solution=solution+1;
      }
    } else if (player1.contains(2) && player1.contains(4)&& !player2.contains(6) && solution==0 ) {
      if (!allPlayedButtons.contains(6)) {
        listButton[6].str = 'O';
        listButton[6].enabled = false;
        listButton[6].clr = Colors.blue;
        player2.add(6);
        solution=solution+1;
      }
    } else {
      var allPlayedButtons = new List.from(player1)..addAll(player2);
      for (int i = 0; i < 9; i++) {
        if (!allPlayedButtons.contains(i)) {
          listButton[i].str = 'O';
          listButton[i].enabled = false;
          listButton[i].clr = Colors.blue;
          player2.add(i);
          break;
        }
      }
    }


    if (1 <= checkWinner(player2)  && checkWinner(player2)  <= 8) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = const Color(0xFF397680FF);

      }
      I2++;
      gamestr = "X $I1 - $I2 AI";

      if(checkWinner(player2)==1)player2=[0,1,2];
      if(checkWinner(player2)==2)player2=[3,4,5];
      if(checkWinner(player2)==3)player2=[6,7,8];
      if(checkWinner(player2)==4)player2=[0,3,6];
      if(checkWinner(player2)==5)player2=[1,4,7];
      if(checkWinner(player2)==6)player2=[2,5,8];
      if(checkWinner(player2)==7)player2=[0,4,8];
      if(checkWinner(player2)==8)player2=[2,4,6];
      for (var element in player2) {   listButton[element].clr = Colors.green;}

      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black, onPressed: () {
            //right way: use context in below level tree with MaterialApp
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => difficulty_screen()));
          },
          ),
          title: const Text("tic tac toe",style:  TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(children: <Widget>[
          Container(color: Colors.black,
            height: 60,
            width: 1,),
          Expanded(
              flex: 10,
              child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(
                        listButton[index].str,
                        style:
                        TextStyle(color: Colors.black, fontSize: 60.0),
                      ),
                      color: listButton[index].clr,
                      disabledColor:  Colors.white,
                      onPressed: () {
                        setState(() {
                          //
                          if (listButton[index].enabled) {
                            playGame(index);
                          }});
                      },
                    );
                  })),
          Expanded(
            flex: 3,
            child: Text(
              gamestr,
              textAlign: TextAlign.start,
              style:  TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: const Text("reset",style:  TextStyle(color: Colors.black) ),
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              reset();
            });
          },
        ),
      ),
    );
  }
}
