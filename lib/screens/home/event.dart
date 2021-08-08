import 'package:flutter/material.dart';
import 'package:spo/shared/components/sized_box.dart';

class Event extends StatelessWidget {
  const Event({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://picsum.photos/250?image=9',
          fit: BoxFit.fitWidth,
          height: 160,
          width: double.infinity,
        ),
        Height(16),
        Text('Giải bóng đá Hyundai Cup 2021',
            style: Theme.of(context).textTheme.subtitle1),
        Height(22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Icon(Icons.person_outlined), Width(4), Text('32')],
            ),
            Row(
              children: [
                Icon(Icons.calendar_today),
                Width(4),
                Text('25/11/2021')
              ],
            ),
          ],
        ),
        Height(20),
        Divider(
          height: 2,
        ),
      ],
    );
  }
}
