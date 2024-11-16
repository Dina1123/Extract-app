import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void showCopyTextMenu(BuildContext context, String text) {
  final RenderBox box = context.findRenderObject() as RenderBox;
  final Offset position = box.localToGlobal(Offset.zero);
  final RelativeRect positionPopup = RelativeRect.fromLTRB(
    position.dx,
    position.dy,
    position.dx + box.size.width,
    position.dy + box.size.height,
  );
  showMenu(
    context: context,
    position: positionPopup,
    items: [
      const PopupMenuItem(
        value: 'copy',
        child: Text('Copy'),
      ),
    ],
  ).then((value) {
    if (value == 'copy') {
      Clipboard.setData(ClipboardData(text: text));
      Get.showSnackbar(
          const SnackBar(content: Text('Text copied')) as GetSnackBar);
    }
  });
}
