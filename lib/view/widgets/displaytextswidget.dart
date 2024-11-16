import 'package:flutter/material.dart';
import 'package:new_dep/core/constants/colors.dart';

class TextWidget extends StatelessWidget {
  String text;
  TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: text == '' ? AppColors.bodyColor : AppColors.bodyColorWhite,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SelectableText(text),
            ),
          ),
        ),
      ),
    );
  }
}
