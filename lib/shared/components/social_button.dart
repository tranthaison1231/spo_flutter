import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spo/shared/components/sized_box.dart';

class SocialButtonGroup extends StatelessWidget {
  final String title;
  final void Function()? onGooglePress;
  final void Function()? onFacebookPress;

  const SocialButtonGroup(
      {Key? key, required this.title, this.onGooglePress, this.onFacebookPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              iconUrl: 'assets/icons/google.svg',
              onPress: onGooglePress,
            ),
            Width(16),
            SocialButton(
              iconUrl: 'assets/icons/facebook.svg',
              onPress: onFacebookPress,
            )
          ],
        )
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconUrl;
  final void Function()? onPress;
  const SocialButton({Key? key, required this.iconUrl, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
        child: IconButton(
          onPressed: onPress,
          icon: SvgPicture.asset(iconUrl),
        ),
      ),
    );
  }
}
