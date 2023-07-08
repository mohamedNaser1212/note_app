import 'package:flutter/Material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, this.onTap}) : super(key: key);
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: KPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
