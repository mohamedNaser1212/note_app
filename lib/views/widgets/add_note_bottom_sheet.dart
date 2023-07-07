import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'custom_Button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'Content',
              maxlines: 5,
            ),
            SizedBox(
              height: 60,
            ),
            CustomButton(),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

