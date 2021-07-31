import 'package:flutter/material.dart';
import 'package:spo/screens/home/place.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({
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
            Text(AppLocalizations.of(context)!.suggestPlace,
                style: Theme.of(context).textTheme.headline6),
            Height(16),
            Container(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Place(),
                  Place(),
                  Place(),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Palette.tertiary,
                ),
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.viewAll,
                  style: Theme.of(context).textTheme.button,
                )),
          ],
        ),
      ),
    );
  }
}
