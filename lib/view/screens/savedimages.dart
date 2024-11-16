import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_dep/bindings/userid.dart';
import 'package:new_dep/controller/savedimagescon.dart';
import 'package:new_dep/view/screens/loading.dart';
import 'package:new_dep/view/widgets/floatingbuttonwidget.dart';
import 'package:new_dep/view/widgets/noimageswidgets.dart';


import '../../applinks.dart';
import '../../core/constants/colors.dart';
import '../widgets/cardwidget.dart';
import 'imagedetailedscreen.dart';

class SavedImagesScreen extends StatefulWidget {
  const SavedImagesScreen({super.key});

  @override
  State<SavedImagesScreen> createState() => _SavedImagesScreenState();
}

class _SavedImagesScreenState extends State<SavedImagesScreen> {
  late SavedImagesControllerImp controller;

  @override
  void initState() {
    super.initState();
    late final String userIdentifier =
        Get.find<MyAppInitialBinding>().userIdentifier;
    // Initialize the controller with userIdentifier
    controller = Get.put(SavedImagesControllerImp(userIdentifier));

    // Fetch data using userIdentifier
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: const CustomDrawer(),
        backgroundColor: AppColors.bodyColor,
        appBar: AppBar(
            title: const Text(
              'Images',
              style: TextStyle(color: AppColors.bodyColor),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons
                        .arrow_back_ios_new_outlined, // You can replace this with your custom icon
                    color: AppColors.bodyColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                );
              },
            ),
            backgroundColor: AppColors.appbarbuttonsColor,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            )),
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: LoadingScreen());
            } else if (controller.data.isEmpty) {
              return Center(
                child: NoImageWidget(noimage: 'There are no images!'),
              );
            } else {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int id) {
                      final item = controller.data[id];
                      final String imageUrl =
                          '${AppLinks.imageuploadserver}${item.images}';
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ImageDetailScreen(image: item));
                        },
                        child: CustomCard(
                          image: imageUrl,
                          text: item.texts,
                          onpressed: () {
                            controller.removeImage(item.id);
                          },
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: FloatingButtonWidget(
                      heroTag: '1',
                      icon: const Icon(
                        Icons.refresh,
                        color: AppColors.bodyColor,
                      ),
                      onpressed: () {
                        if (controller.isLoading.value) {
                          const LoadingScreen();
                        } else {
                          controller.fetchData();
                        }
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
