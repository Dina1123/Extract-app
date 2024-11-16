import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_dep/core/constants/colors.dart';
import 'package:new_dep/data/models/imagesmodel.dart';

import '../../applinks.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageModel image;

  const ImageDetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = '${AppLinks.imageuploadserver}${image.images}';
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bodyColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          height: Get.height * 0.8,
                          width: Get.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SelectableText(
                        image.texts,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.copy),
                            color: AppColors.appbarbuttonsColor,
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: image.texts),
                              );
                              Get.snackbar(
                                "Copied",
                                "Text copied to clipboard",
                                icon: const Icon(
                                  Icons.check_box_rounded,
                                  color: AppColors.greenColor,
                                ),
                                colorText: AppColors.bodyColorWhite,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundGradient: const LinearGradient(
                                  colors: [
                                    AppColors.blueColor,
                                    AppColors.appbarbuttonsColor,
                                    AppColors.pinkColor,
                                    AppColors.greenColor
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.appbarbuttonsColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: IconButton(
                  icon: const Icon(Icons.close,
                      color: AppColors.bodyColorWhite, size: 22),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
