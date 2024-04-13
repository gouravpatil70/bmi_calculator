import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textFieldLabel;
  final IconData textFieldIcon;
  CustomTextField({super.key, required this.textEditingController, required this.textFieldLabel, required this.textFieldIcon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          labelText: textFieldLabel,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            textFieldIcon,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}