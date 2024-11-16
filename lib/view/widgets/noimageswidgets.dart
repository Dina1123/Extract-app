import 'package:flutter/material.dart';
import 'package:new_dep/core/constants/colors.dart';

class NoImageWidget extends StatelessWidget {
  NoImageWidget({super.key, required this.noimage});
  String noimage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.image,
          size: 100,
          color: AppColors.appbarbuttonsColor,
        ),
        const SizedBox(height: 16.0),
        Text(noimage,
            style: const TextStyle(
                fontSize: 18.0,
                color: AppColors.appbarbuttonsColor,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
