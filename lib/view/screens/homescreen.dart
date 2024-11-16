import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_dep/bindings/userid.dart';
import 'package:new_dep/core/functions/showimagepicker.dart';
import 'package:new_dep/view/widgets/appbar.dart';
import 'package:new_dep/view/widgets/displaytextswidget.dart';
import 'package:new_dep/view/widgets/drawer.dart';
import 'package:new_dep/view/widgets/imagewidget.dart';
import 'package:new_dep/view/widgets/noimageswidgets.dart';


import '../../controller/homescreencon.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/showcopytextmenue.dart';
import '../widgets/floatingbuttonwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UploadingImageControllerImp controller;

  // Get the userIdentifier from the initial binding

  @override
  void initState() {
    super.initState();

    // Get the userIdentifier from the initial binding
    final String userIdentifier =
        Get.find<MyAppInitialBinding>().userIdentifier;

    // Initialize the controller in initState
    controller = Get.put(UploadingImageControllerImp(userIdentifier));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      appBar: CustomAppbar(
        title: 'Text Extraction',
      ),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onLongPress: () {
                    final copyText = controller.extractedText;
                    if (copyText.isNotEmpty) {
                      showCopyTextMenu(context, copyText);
                    }
                  },
                  child: Obx(() => controller.isload.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.extractedText == ''
                          ? const Text('')
                          : TextWidget(text: controller.extractedText)),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Obx(
                    () {
                      if (controller.isload.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.image == null) {
                        return NoImageWidget(
                          noimage: 'No Image Selected',
                        );
                      } else {
                        return ImageWidget(image: controller.image!);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: FloatingButtonWidget(
              heroTag: '1',
              icon: const Icon(
                Icons.save,
                color: AppColors.bodyColor,
              ),
              onpressed: () async {
                await controller.uploadToServer();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButtonWidget(
        heroTag: '2',
        icon: const Icon(
          Icons.add_a_photo_rounded,
          color: AppColors.bodyColor,
        ),
        onpressed: () {
          ShowImagePicker.showImageSourcePicker(controller);
        },
      ),
    );
  }
}
