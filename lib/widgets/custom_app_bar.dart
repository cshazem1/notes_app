import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
final  String? appBarName;
final Icon? icon;

   const CustomAppBar({ this.appBarName,this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      minimum: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:  [

           Text(appBarName??"",
              style: TextStyle(

                fontSize: 35,
              )),
          CustomSearchIcon(icon: icon)
        ],
      ),
    );
  }
}
