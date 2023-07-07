import 'package:flutter/Material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder( KPrimaryColor),
        // label: const Text(
        //   'Title',
        //   style: TextStyle(
        //     color: Colors.cyanAccent
        //   ),
        // ),
        hintText:'Title',
        hintStyle:const TextStyle(
            color: KPrimaryColor
        ) ,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
