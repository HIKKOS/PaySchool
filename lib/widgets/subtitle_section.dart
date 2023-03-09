import 'package:flutter/material.dart';
import '../pages/global/app_colors.dart';

class SubtitleSection extends StatelessWidget {
  const SubtitleSection({
    Key? key,
    required this.subtitle,
    required this.color, required this.fontsize, required this.fontWeight,
  }) : super(key: key);

  final String subtitle;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '$subtitle',
        style:
            TextStyle(color: color, fontSize: fontsize, fontWeight: fontWeight ),
      ),
    );
  }
}
// todo implement
