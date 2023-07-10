import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          onPressed:onPressed,
        ),
      ),
    );
  }
}
