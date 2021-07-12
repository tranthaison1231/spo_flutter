import 'package:flutter/material.dart';
import 'package:spo/shared/components/search.dart';
import 'package:spo/shared/utils/theme.dart';

class SportSelector extends StatefulWidget {
  SportSelector({Key? key}) : super(key: key);

  @override
  _SportSelectorState createState() => _SportSelectorState();
}

class _SportSelectorState extends State<SportSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                  child: Column(children: [
                    Text('What is favorite sport?',
                        style: Theme.of(context).textTheme.headline5),
                    Padding(
                      padding: EdgeInsets.all(Sizes.xl),
                      child: Search(),
                    )
                  ]),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.xl),
                    child: Text('What is favorite sport?',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
