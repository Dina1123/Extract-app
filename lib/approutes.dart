import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_dep/view/screens/homescreen.dart';
import 'package:new_dep/view/screens/savedimages.dart';
import 'package:new_dep/view/screens/splashscreen.dart';


import 'core/constants/routes.dart';

List<GetPage<dynamic>> routesgetx = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.savedimgs, page: () => const SavedImagesScreen()),
];
