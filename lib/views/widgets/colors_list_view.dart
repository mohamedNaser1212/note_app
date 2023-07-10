import 'package:flutter/Material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Colors.blue,
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ColorItem();
          }),
    );
  }
}
