import 'package:get/get.dart';

class HomePageController extends GetxController {
  var email = ''.obs;

  void updateEmail(newEmail) {
    email.value = newEmail;
  }
}
