import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spo/screens/news/post.dart';
import 'package:spo/shared/components/sized_box.dart';
import 'package:spo/shared/utils/theme.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.sm),
        child: Column(
          children: [
            Center(
              child: Text(
                'News',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Height(64),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: createPost,
                isScrollControlled: true,
              ),
              child: Padding(
                padding: EdgeInsets.all(Sizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                      backgroundColor: Colors.red,
                      radius: 20,
                    ),
                    Text('Create Post'),
                    Container(
                        decoration: BoxDecoration(
                          color: Palette.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(Sizes.xs),
                            child: Icon(Icons.add)))
                  ],
                ),
              ),
            ),
            Height(24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Post(),
                    Post(),
                    Post(),
                    Post(),
                    Post(),
                    Post(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createPost(BuildContext context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: Padding(
          padding: EdgeInsets.all(Sizes.xl),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Create Post',
              style: Theme.of(context).textTheme.headline6,
            ),
            Height(40),
            Text(
              'Add photo',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Height(8),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/proxy/8U2ahSrskNC_SAa47bTDZuq7FZRg6Ueyi5hALcBLRSf38ASwWdhEO1ledyW14lDCzTOJpOBEKuE9kWsfqHGfCp3B9o4I9qD_XnjyQHU'),
                  height: 144,
                  width: 144,
                  fit: BoxFit.fill,
                ),
                Width(16),
                Image(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/proxy/8U2ahSrskNC_SAa47bTDZuq7FZRg6Ueyi5hALcBLRSf38ASwWdhEO1ledyW14lDCzTOJpOBEKuE9kWsfqHGfCp3B9o4I9qD_XnjyQHU'),
                  height: 144,
                  width: 144,
                  fit: BoxFit.fill,
                )
              ],
            ),
            Height(32),
            FormBuilderTextField(
              name: 'title',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Title'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
            ),
            Height(32),
            FormBuilderTextField(
              name: 'description',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Description'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
            ),
            Height(32),
            FormBuilderDropdown(
              name: 'gender',
              decoration: InputDecoration(
                labelText: 'Tag',
              ),
              allowClear: true,
              hint: Text('Select Tag'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: []
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text('$gender'),
                      ))
                  .toList(),
            ),
            Height(34),
            FormBuilderDropdown(
              name: 'gender',
              decoration: InputDecoration(
                labelText: 'Friend Tag',
              ),
              // initialValue: 'Male',
              allowClear: true,
              hint: Text('Select Tag'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
            ),
            Height(40),
            ElevatedButton(
              onPressed: () {},
              child: Text("Publish"),
            ),
          ]),
        ),
      );
}
