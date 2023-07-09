import 'package:flutter/Material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, this.onTap,  this.isLoading=false}) : super(key: key);
final void Function()? onTap;
final bool isLoading ;
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
        child: Center(
            child:isLoading? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ) : const Text(
              'Add',
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
