import 'package:flutter/material.dart';

import '../core/enties/service.dart';
import '../data/repositories/app_colors.dart';

class SubtitleSection extends StatelessWidget {
  const SubtitleSection({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Text(
        '$subtitle',
        style: const TextStyle(
            color: AppColors.primary,
            fontSize: 20,
          ),
      ),
    );
  }
}