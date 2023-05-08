import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    this.validator,
    this.onChanged,
    this.icon,
    required this.label,
    required this.controller,
    super.key,
  });

  bool? validator;
  Function(String)? onChanged;
  IconData? icon;
  final String label;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
        errorStyle: TextStyle(fontSize: 9, height: 0.3),
        suffixIcon: widget.icon != null 
          ? IconButton(
            icon: Icon(
              widget.icon,
              color: Colors.deepPurple,
            ),
            onPressed: () {},
          )
          : null,
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        // errorText: '',
      ),
      validator: widget.validator == true
      ? (value) {
          if(value == null || value.isEmpty) {
            return 'Informe o ${widget.label}';
          }
        }
      : null
    );
  }
}