import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
      margin:const EdgeInsets.symmetric(vertical: 10) ,
      decoration: BoxDecoration(
          color: const Color(0xffFFCC80), borderRadius: BorderRadius.circular(16)),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            trailing: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.delete, color: Colors.black,size: 35,),
              onPressed: () {},
            ),
            title: const Text("data",
                style: TextStyle(color: Colors.black, fontSize: 26)),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("hazem mahmoud ",
                  style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              "may21 , 2022",
              style: TextStyle(color: Colors.black.withOpacity(.6),fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
