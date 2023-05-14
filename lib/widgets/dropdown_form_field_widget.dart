// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class DropdownFormFieldWidget extends StatefulWidget {
  DropdownFormFieldWidget({
    required this.listItems,
    this.onChanged,
    super.key,
  });

  final List<String> listItems;
  Function(String?)? onChanged;

  @override
  State<DropdownFormFieldWidget> createState() => _DropdownFormFieldWidgetState();
}

class _DropdownFormFieldWidgetState extends State<DropdownFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    String ufSelecionado = '';

    return SizedBox(
      height: 46.5,
      child: DropdownButtonFormField(
        value: ufSelecionado,
        items: widget.listItems.map(
          (e) => DropdownMenuItem(value: e, child: Text(e)),
        ).toList(),
        onChanged: (uf) {
            ufSelecionado = uf as String;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 11, right: 4),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'UF',
          labelStyle: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.7,
            ),
          ),
        ),
      ),
    );
  }
}