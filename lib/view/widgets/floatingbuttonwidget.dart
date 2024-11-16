import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  FloatingButtonWidget(
      {super.key,
      required this.heroTag,
      required this.icon,
      required this.onpressed});
  final Function() onpressed;
  Icon icon;
  String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 30, 82, 124),
        heroTag: heroTag,
        onPressed: onpressed,
        tooltip: 'Save',
        child: icon);
  }
}
