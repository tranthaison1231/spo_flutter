import 'package:flutter/material.dart';
import 'package:spo/shared/components/sized_box.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final int count;
  const ActionButton({Key? key, required this.icon, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Width(8),
        Text('25'),
      ],
    );
  }
}
