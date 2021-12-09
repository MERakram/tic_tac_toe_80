import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_real/vs_ai_easy.dart';
import 'package:tic_tac_toe_real/vs_ai_medium.dart';

import 'home_screen.dart';

class difficulty_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
        appBar: AppBar(
        leading: BackButton(
        color: Colors.white, onPressed: () {
      //right way: use context in below level tree with MaterialApp
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    },
    ),
          backgroundColor: Colors.black),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget> [
              Center(
                child: RaisedButton(

                    child: const Text('EASY', style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),),
                    onPressed:() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => vs_ai_easy()));

                    }),
              ),
                const SizedBox(
                  height: 19.0,
                  width: 300.0,
                ),
                Center(
                  child: RaisedButton(
                      child: const Text('MEDIUM', style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),),
                      onPressed:() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => vs_ai_medium()));
                      }),

                ),
                const SizedBox(
                  height: 19.0,
                  width: 300.0,
                ),
                Center(
                  child: RaisedButton(
                      child: const Text('HARD', style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),),
                      onPressed:() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => vs_ai_medium()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}