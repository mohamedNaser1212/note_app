import 'package:flutter/Material.dart';

import 'custom_Button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child:   Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value){
              title=value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value){
              subtitle=value;
            },
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                autovalidateMode=AutovalidateMode.always;
                setState(() {

                });
              }
            },
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}


