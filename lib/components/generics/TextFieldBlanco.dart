// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBlanco {
  Widget GetTextField(TextEditingController controller, String hint, IconData icon, {String? errorText}) {
    final bool isError = errorText != null && errorText.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: isError ? Colors.red : Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 14), // Ajuste vertical del contenido
              prefixIcon: Icon(icon, color: Colors.black54),
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
        if (isError)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
