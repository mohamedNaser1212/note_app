import 'package:flutter/Material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'colors_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentindex;
  @override
  void initState() {
    currentindex=Kcolors.indexOf(Color(widget.note.color));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
                  widget.note.color=Kcolors[index].value;
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
