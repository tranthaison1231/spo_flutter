import 'package:flutter/material.dart';
import 'package:spo/screens/home/event.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class Events extends StatelessWidget {
  const Events({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Sizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Events', style: Theme.of(context).textTheme.headline6),
            Height(16),
            Event(),
            Height(16),
            Event(),
          ],
        ),
      ),
    );
  }
}
