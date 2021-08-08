import 'package:flutter/material.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class Place extends StatelessWidget {
  const Place({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://picsum.photos/250?image=9',
                    fit: BoxFit.fill,
                    height: 160,
                    width: double.infinity,
                  ),
                  Height(16),
                  Text(
                    'Sân Tuyên Sơn',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Height(8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Đang mở', style: TextStyle(color: Colors.green)),
                        Text('Đà Nẵng')
                      ]),
                  Height(8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Palette.secondary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Width(8),
                                Text('4.5',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )),
                        Text('1.5 Km'),
                        Text('-10%', style: TextStyle(color: Colors.red))
                      ]),
                ],
              )),
        ],
      ),
    );
  }
}
