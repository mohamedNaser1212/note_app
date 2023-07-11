import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';

import '../../constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          itemCount: Kcolors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap:(){
                  currentindex=index;
                  BlocProvider.of<AddNoteCubit>(context).color=Kcolors[index];
                  setState(() {

                  });
                } ,
                child: ColorItem(
                  color: Kcolors[index],
                  isActive: currentindex==index,
                ),
              ),
            );
          }),
    );
  }
}
