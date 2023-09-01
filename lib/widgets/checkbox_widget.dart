import 'package:flutter/material.dart';
import '../models/checkbox_model.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    required this.item,
    required this.checkboxList,
    super.key
  });

  final CheckBoxModel item;
  final List<CheckBoxModel> checkboxList;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(38, 209, 196, 233),
        borderRadius: BorderRadius.circular(5),
      ),
      child: CheckboxListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.title),
            Text(
              widget.item.subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ]
        ),
        value: widget.item.checked,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) {
          setState(() {
            widget.item.checked = value ?? false;
            widget.checkboxList.add(widget.item);
          });
        },
      ),
    );
  }
}