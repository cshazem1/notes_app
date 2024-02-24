import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String? appBarName;
  final Icon? icon;
  const CustomAppBar(
      {this.appBarName, this.icon, required this.callback, super.key});
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(appBarName ?? "",
              style: const TextStyle(
                fontSize: 35,
              )),
          GestureDetector(onTap: callback, child: CustomIcon(icon: icon))
        ],
      ),
    );
  }
}
