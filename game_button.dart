import 'package:flutter/material.dart';
class GameButton {

  late int id;
  late Color clr;
  late bool enabled;
  late String str;
  GameButton(id){

    this.id= id;
    this.clr= Colors.white;
    this.enabled =true;
    this.str='';
  }

}
