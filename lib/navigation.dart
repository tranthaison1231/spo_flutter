import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:spo/screens/create_place.dart';
import 'package:spo/screens/user_info/user_info.dart';
import 'package:spo/screens/home/home.dart';
import 'package:spo/screens/News/news.dart';
import 'package:spo/shared/utils/theme.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTab = 0;
  Widget currentScreen = Home();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNavbarItem(
                    tab: 0,
                    icon: Icons.home_outlined,
                    screen: Home(),
                  ),
                  buildNavbarItem(
                    tab: 1,
                    icon: Icons.book,
                    minWidth: 40,
                    screen: News(),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNavbarItem(
                    tab: 2,
                    icon: Icons.calendar_today,
                    minWidth: 40,
                    screen: CreatePlace(),
                  ),
                  buildNavbarItem(
                    tab: 3,
                    icon: Icons.person_rounded,
                    screen: UserInfo(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Palette.secondary,
        activeBackgroundColor: Colors.grey,
        children: [
          SpeedDialChild(
            child: Icon(Icons.person),
            backgroundColor: Palette.primary,
            foregroundColor: Colors.white,
            label: 'Người chơi',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.people),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Tạo nhóm',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.sports_soccer),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Tạo sân',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.event),
            backgroundColor: Palette.secondary,
            foregroundColor: Colors.white,
            label: 'Tạo event',
            onTap: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavbarItem({
    required int tab,
    required IconData icon,
    required Widget screen,
    double? minWidth,
  }) {
    return MaterialButton(
      minWidth: minWidth,
      onPressed: () {
        setState(() {
          currentScreen = screen;
          currentTab = tab;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: tab == currentTab ? Palette.primary : Colors.grey,
          )
        ],
      ),
    );
  }
}
