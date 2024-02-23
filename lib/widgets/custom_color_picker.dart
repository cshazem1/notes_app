
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/widgets/custom_circle_color.dart';



class ColorPickerPage extends StatefulWidget {
   const ColorPickerPage({super.key,  this.colorX});
 static String id="color";
 final Function(Color)? colorX;

  @override
  ColorPickerPageState createState() => ColorPickerPageState();
}

class ColorPickerPageState extends State<ColorPickerPage> {
  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomCircleColor(color: currentColor,diameter: 50,call: ()  {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Pick a color'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: currentColor,
                    onColorChanged: changeColor,
                    showLabel: true,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      widget.colorX!(currentColor);

                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        ,)
        );

  }
}
