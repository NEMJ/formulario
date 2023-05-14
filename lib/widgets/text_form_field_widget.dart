// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    this.validator,
    this.onChanged,
    this.onPressedIcon,
    this.onPressedIconAsync,
    this.icon,
    required this.label,
    required this.controller,
    super.key,
  });

  bool? validator;
  Function(String)? onChanged;
  Future<Null> Function()? onPressedIconAsync;
  Function? onPressedIcon;
  IconData? icon;
  final String label;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  
  String hintText = '';

  @override
  Widget build(BuildContext context) {
    

    // Lógica para colocar alguma função no "onPressed" do TextFormField
    final onPressed;

    if(widget.onPressedIcon != null) {
      onPressed = widget.onPressedIcon;
    } else if(widget.onPressedIconAsync != null) {
      onPressed = widget.onPressedIconAsync;
    } else {
      onPressed = null;
    }
    // ---

  
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
        errorStyle: const TextStyle(fontSize: 0, height: -8),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Color.fromARGB(180, 211, 47, 47),
          ),
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(180, 211, 47, 47)),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.icon != null 
          ? IconButton(
            icon: Icon(
              widget.icon,
              color: Colors.deepPurple,
            ),
            onPressed: onPressed ?? () {}
          )
          : null,
      ),
      validator: widget.validator == true
      ? (value) {
          if(value == null || value.isEmpty) {
            setState(() => hintText = 'campo obrigatório');
            return '';
          } else {
            setState(() => hintText = '');
          }
          return null;
        }
      : null
    );
  }
}