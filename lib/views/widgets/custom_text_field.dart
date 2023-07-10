import 'package:flutter/Material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key, required this.hint, this.maxlines=1, this.onSaved, this.onchanged})
      : super(key: key);
  final String hint;
  final int maxlines;
  final void Function(String)? onchanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return'Field is required';
        }else{
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(

        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(KPrimaryColor),
        hintText: hint,
        hintStyle: const TextStyle(color: KPrimaryColor),
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
