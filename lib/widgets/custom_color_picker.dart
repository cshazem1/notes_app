import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/widgets/custom_circle_color.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key, this.changColor, this.colors});
  static String id = "color";
  final int? colors;
  final Function(Color)? changColor;

  @override
  ColorPickerPageState createState() => ColorPickerPageState();
}

class ColorPickerPageState extends State<ColorPickerPage> {
  late Color currentColor;
  @override
  void initState() {
    currentColor = Color(widget.colors ?? Colors.blue.value);
    super.initState();
  }

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomCircleColor(
      color: currentColor,
      diameter: 50,
      call: () {
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
                    widget.changColor!(currentColor);

                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    ));
  }
}
