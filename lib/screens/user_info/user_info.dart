import 'package:flutter/material.dart';
import 'package:spo/screens/user_info/card_info.dart';
import 'package:spo/shared/components/custom_button.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Info',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Height(64),
              Expanded(
                  child: Card(
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -50,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://www.woolha.com/media/2020/03/eevee.png',
                            ),
                            backgroundColor: Colors.red,
                            radius: 74,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.xl),
                      child: Column(
                        children: [
                          Height(80),
                          Text('Nguyễn Anh Đức',
                              style: Theme.of(context).textTheme.headline6),
                          Height(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CardInfo(title: 'Các sự kiện', value: '1'),
                              CardInfo(title: 'Lượt theo dõi', value: '102'),
                              CardInfo(title: 'Người theo dõi', value: '50'),
                            ],
                          ),
                          Height(32),
                          Divider(
                            height: 2,
                          ),
                          Height(32),
                          CustomButton(
                            prefix: Icon(
                              Icons.people,
                              color: Palette.secondary,
                            ),
                            text: 'Mời bạn bè',
                          ),
                          Height(16),
                          CustomButton(
                            prefix: Icon(
                              Icons.history,
                              color: Palette.secondary,
                            ),
                            text: 'Lịch sử giao dịch',
                          ),
                          Height(16),
                          CustomButton(
                            prefix: Icon(
                              Icons.settings,
                              color: Palette.secondary,
                            ),
                            text: 'Cài đặt',
                          ),
                          Height(45),
                          CustomButton(
                            prefix: Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                            ),
                            text: 'Đăng xuất',
                            suffix: Icon(
                              Icons.arrow_forward,
                              color: Palette.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
