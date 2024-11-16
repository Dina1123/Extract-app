import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_dep/approutes.dart';
import 'package:new_dep/bindings/userid.dart';
import 'package:new_dep/core/constants/themedata.dart';
import 'package:new_dep/core/services/services.dart';

import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use FutureBuilder to fetch the userIdentifier from shared preferences
      future: _getUserIdentifier(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String userIdentifier = snapshot.data as String;
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: myTheme,
            getPages: routesgetx,
            // Pass the user identifier to bindings
            initialBinding: MyAppInitialBinding(userIdentifier),
          );
        } else {
          // Handle loading state
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<String> _getUserIdentifier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if userIdentifier is already stored
    String? userIdentifier = prefs.getString('userIdentifier');
    if (userIdentifier == null) {
      // Generate a new userIdentifier
      userIdentifier = const Uuid().v4();

      // Save userIdentifier to shared preferences
      prefs.setString('userIdentifier', userIdentifier);
    }

    return userIdentifier;
  }
}
