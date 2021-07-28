import 'package:flutter/material.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final String value;
  const CardInfo({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.sm),
        ),
        child: Padding(
          padding: EdgeInsets.all(Sizes.xs),
          child: Column(
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Height(4),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ));
  }
}
