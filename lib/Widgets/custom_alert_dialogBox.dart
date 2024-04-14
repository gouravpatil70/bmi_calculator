import 'package:flutter/material.dart';

class CustomDialogBox{

  static void showDialogBox(BuildContext context, double bmiValue, String simpleResult){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Your BMI value is : ${bmiValue.toStringAsFixed(2)} & you're $simpleResult"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            )
          ],
        );
      }
    );
  }
}