import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_dep/core/constants/routes.dart';


import '../../core/constants/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: AppColors.appbarbuttonsColor,
      child: Container(
        decoration: const BoxDecoration(color: AppColors.appbarbuttonsColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.image_search_sharp,
                  color: AppColors.bodyColor,
                  size: 100,
                )),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: AppColors.bodyColor,
                size: 30,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: AppColors.bodyColor, fontSize: 20),
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: AppColors.bodyColor,
                size: 30,
              ),
              title: const Text(
                'Saved Images',
                style: TextStyle(color: AppColors.bodyColor, fontSize: 20),
              ),
              onTap: () {
                Get.offAndToNamed(AppRoute.savedimgs);
              },
            ),
          ],
        ),
      ),
    );
  }
}
