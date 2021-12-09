import 'package:flutter/material.dart';
import 'package:tic_tac_toe_real/vs_player.dart';



import 'difficulty_screen.dart';

class GlowingButton2 extends StatefulWidget {
  final Color color1;
  final Color color2;

  const GlowingButton2(
      { Key? key, this.color1 = Colors.cyan, this.color2 = Colors.greenAccent})
      : super(key: key);
  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton2> {
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {

          //right way: use context in below level tree with MaterialApp
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => vs_player()));

      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 55,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
              BoxShadow(
                color: widget.color1.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(-8, 0),
              ),
              BoxShadow(
                color: widget.color2.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(8, 0),
              ),
              BoxShadow(
                color: widget.color1.withOpacity(0.2),
                spreadRadius: 16,
                blurRadius: 32,
                offset: const Offset(-8, 0),
              ),
              BoxShadow(
                color: widget.color2.withOpacity(0.2),
                spreadRadius: 16,
                blurRadius: 32,
                offset: const Offset(8, 0),
              )
            ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(

              glowing ? Icons.face : Icons.face,
              size:35.0,
              color: Colors.black,
            ),
            Text(
              glowing ? "    vs player   " : "Dimmed",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),

          ],
        ),
      ),
    );
  }
}