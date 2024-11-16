import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:new_dep/controller/homescreencon.dart';
import 'package:new_dep/controller/savedimagescon.dart';


class MyAppInitialBinding extends Bindings {
  final String userIdentifier;

  MyAppInitialBinding(this.userIdentifier);

  @override
  void dependencies() {
    Get.lazyPut<UploadingImageController>(
        () => UploadingImageControllerImp(userIdentifier));

    Get.lazyPut<SavedImagesController>(
        () => SavedImagesControllerImp(userIdentifier));

    Get.lazyPut(() => MyAppInitialBinding(userIdentifier));
  }
}
