import 'package:flutter/material.dart';
import 'package:spo/shared/utils/theme.dart';

class CustomIconButton extends StatelessWidget {
  final String? iconUrl;
  const CustomIconButton({Key? key, this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.xs),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white.withOpacity(0.5),
            image: DecorationImage(
                image: AssetImage(iconUrl ?? 'assets/images/logo.png'))),
      ),
    );
  }
}
