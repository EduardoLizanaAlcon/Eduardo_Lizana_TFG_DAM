// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LetraRegistroLogin{
  Widget GetLetraRegistroLogin(List<TextEditingController> controllers, int index, BuildContext context){
    return Container(
      width: 30,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextField(
        controller: controllers[index],
        style: TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 7) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );

  }

}