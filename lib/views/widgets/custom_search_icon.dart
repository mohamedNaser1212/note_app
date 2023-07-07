import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 46,
      decoration:  BoxDecoration(
        color: Colors.white.withOpacity(0.07),

        borderRadius: BorderRadius.circular(16),
      ),
      child:  Center(
        child: Icon(icon,color: Colors.white,size:28,),
      ),
    );
  }
}
