import 'package:flutter/material.dart';
import 'package:spo/shared/components/action.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Sizes.lg),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                      backgroundColor: Colors.red,
                      radius: 20,
                    ),
                    Width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyễn Văn Anh',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text('5 phút trước'),
                      ],
                    ),
                  ],
                ),
                Container(
                    width: 80,
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Palette.secondary,
                        ),
                        onPressed: () {},
                        child: Text('Follow'))),
              ],
            ),
            Height(26),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(color: Palette.primary)),
            Height(12),
            Container(
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    fit: BoxFit.fill,
                    height: 200,
                  )),
            ),
            Height(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(icon: Icons.favorite, count: 20),
                ActionButton(icon: Icons.comment, count: 20),
                ActionButton(icon: Icons.remove_red_eye, count: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
