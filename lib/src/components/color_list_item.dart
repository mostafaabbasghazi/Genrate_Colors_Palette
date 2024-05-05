import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:color_genrator/src/models/color_info.dart';

class ColorListItem extends StatelessWidget {
  final ColorInfo colorInfo;

  const ColorListItem({super.key, required this.colorInfo});
  Color hexToRgb(String hexColor) {
    if (hexColor.startsWith('#')) {
      hexColor = hexColor.substring(1);
      print(hexColor);
    }
    print(hexColor);

    int r = int.parse(hexColor.substring(0, 2), radix: 16);
    int g = int.parse(hexColor.substring(2, 4), radix: 16);
    int b = int.parse(hexColor.substring(4, 6), radix: 16);

    return Color.fromRGBO(r, g, b, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    String hexCode = colorInfo.color.toString().substring(10, 16).toUpperCase();
    Color rgbColor = hexToRgb(hexCode);
    return Container(
      color: colorInfo.color,
      height: 136,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "#$hexCode",
              style: TextStyle(
                color: rgbColor.computeLuminance() > 0.3
                    ? Colors.black
                    : Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "(${rgbColor.red}, ${rgbColor.green}, ${rgbColor.blue})",
              style: TextStyle(
                color: rgbColor.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.copy,
                color: rgbColor.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
              ),
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: hexCode.toString()));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Copied to Clipboard'),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
