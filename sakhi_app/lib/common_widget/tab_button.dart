import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TabButton({super.key, required this.icon, required this.selectIcon, required this.isActive,  required this.onTap});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(isActive ? selectIcon : icon,
            width: 25, height: 25, fit: BoxFit.fitWidth),
        SizedBox(
          height: isActive ?  8: 12,
        ),
        if(isActive)
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(

                color: Color.fromRGBO(255, 221, 230, 1.0),

                borderRadius: BorderRadius.circular(2)),
          )
      ]),
    );

  }
}
