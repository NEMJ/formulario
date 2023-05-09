import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    this.validator,
    this.onChanged,
    this.date,
    required this.label,
    required this.controller,
    super.key,
  });

  bool? validator;
  Function(String)? onChanged;
  bool? date;
  final String label;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  
  String hintText = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
        errorStyle: const TextStyle(fontSize: 0, height: -8),
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
        suffixIcon: widget.date != null 
          ? IconButton(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Colors.deepPurple,
            ),
            onPressed: (widget.date == true)
            ? () async {
              DateTime? datePicker = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1920),
                lastDate: DateTime(2120),
                // locale: Locale('pt', 'BR'),
              );

              if(datePicker != null) {
                setState(() {
                  widget.controller.text = DateFormat('dd/MM/yyyy').format(datePicker);
                });
              }
            }
            : () {}
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
        }
      : null
    );
  }
}