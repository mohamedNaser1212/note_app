import 'package:flutter/Material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?    CircleAvatar(

      backgroundColor: Colors.white,
      radius: 38,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ):  CircleAvatar(
      radius: 36,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentindex=0;
  List<Color>colors=const [
    Color(0xffC89B7B),
    Color(0xffB80C09),
    Color(0xff3A4F41),
    Color(0xffF0F757),
    Color(0xff81B29A),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap:(){
                  currentindex=index;
                  setState(() {

                  });
                } ,
                child: ColorItem(
                  color: colors[index],
                  isActive: currentindex==index,
                ),
              ),
            );
          }),
    );
  }
}
