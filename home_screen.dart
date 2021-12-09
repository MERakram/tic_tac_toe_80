import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glowing_button.dart';
import 'glowing_button2.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Text('TIC TAC TOE ', style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gotham',
            ),),
            const SizedBox(
              height: 19.0,
              width: 300.0,
            ),
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                  color: Colors.white,
                ),
                width: 270,
                child: const Image(
                  image: AssetImage('images/avatar.png'),
                )),
            const SizedBox(
              height: 30.0,
              width: 300.0,
            ),
            const Text(
              'choose your play mode',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gotham',
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 300.0,
            ),
            const Center(
              child: GlowingButton(
                color1: Colors.black,
                color2: Colors.white,
              ),
            ),

            const SizedBox(
              height: 20.0,
              width: 300.0,
            ),
            const GlowingButton2(
              color1: Colors.white,
              color2: Colors.black,),
          ],
        ),
      ),
    );
  }
}
