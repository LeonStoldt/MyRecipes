import 'dart:async';

import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _fromTime = TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_labelTime),
            SizedBox(height: 16),
            RaisedButton(
              child: Text("Set Time"),
              onPressed: () {_showTimePicker();},
            )
          ],
    );
  }

  String get _labelTime {
      return _fromTime.format(context);
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _fromTime,
    );
    if (picked != null && picked != _fromTime) {
      setState(() {
        _fromTime = picked;
      });
    }
  }
}