import 'package:get/get.dart';
import '../controllers/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
  }
}
