import 'package:flutter/Material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          const CustomAppBar(title:'Edit Notes', icon: FontAwesomeIcons.check,),
          SizedBox(
            height: 50,
          ),
          CustomTextField(hint: 'Title',),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(hint: 'Content',maxlines: 5,),
          SizedBox(
            height: 50,
          ),
          // CustomButton(),


        ],
      ),
    );
  }
}
