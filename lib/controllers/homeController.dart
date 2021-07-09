import 'package:get/get.dart';

class HomePageController extends GetxController {
  String status = 'Unknown';
  int usersCount = 10;

  void updateStatus(newStatus) {
    status = newStatus;
    print(status);
    update(['status_widget']);
  }

  void addUsers() {
    usersCount += 1;
    update(['userscount_widget']);
  }
}
