import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:  [

          Text("Notes",
              style: TextStyle(

                fontSize: 35,
              )),
          CustomSearchIcon()
        ],
      ),
    );
  }
}
