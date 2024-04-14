import 'package:flutter/material.dart';

class CustomSnackBar{
  final String snackBarContent;
  final Color snackBarBackgroundColor;
  CustomSnackBar({required this.snackBarContent, required this.snackBarBackgroundColor});


  SnackBar showSnackBar(){
    return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      backgroundColor: snackBarBackgroundColor,
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      behavior: SnackBarBehavior.floating,
      
      content: Text(
        snackBarContent,
        style: const TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}