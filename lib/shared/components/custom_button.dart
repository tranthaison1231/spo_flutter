import 'package:flutter/material.dart';
import 'package:spo/shared/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final Widget prefix;
  final Widget? suffix;
  final VoidCallback onPressed;
  final String text;
  const CustomButton(
      {Key? key,
      required this.prefix,
      required this.onPressed,
      this.suffix,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix,
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            suffix != null ? suffix! : SizedBox.shrink(),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(Sizes.md),
          primary: Colors.white,
        ));
  }
}
