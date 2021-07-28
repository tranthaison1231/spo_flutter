import 'package:flutter/material.dart';
import 'package:spo/screens/user_info/user_info.dart';
import 'package:spo/screens/events.dart';
import 'package:spo/screens/home.dart';
import 'package:spo/screens/News/news.dart';
import 'package:spo/shared/utils/theme.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTab = 0;
  Widget currentScreen = UserInfo();
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
                    screen: Events(),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
