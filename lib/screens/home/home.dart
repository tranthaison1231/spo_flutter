import 'package:flutter/material.dart';
import 'package:spo/screens/home/city_selector.dart';
import 'package:spo/screens/home/events.dart';
import 'package:spo/screens/home/place_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 32),
          child: CitySelector(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 32),
            child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: () {}),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: EdgeInsets.fromLTRB(32, 24, 32, 24),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Tìm kiếm sân chơi',
                  hintStyle: Theme.of(context).textTheme.caption,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  filled: true),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlaceList(),
              Events(),
            ],
          ),
        ),
      ),
    );
  }
}
