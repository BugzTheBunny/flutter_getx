import 'package:get/get.dart';

class HomePageController extends GetxController {
  var status = 'Unknown'.obs;
  var usersCount = 10.obs;

  @override
  void onInit() {
    everAll([status, usersCount], (_) => print('Something is updated...'));

    ever(status, (_) {
      print('This will run everything we call the variable!');
    });

    ever(usersCount, (_) {
      print('The users count was updated.');
    });

    once(usersCount, (_) {
      print('This will be called one time only!');
    });

    debounce(usersCount, (number) {
      print(number);
    }, time: Duration(seconds: 2));

    super.onInit();
  }

  void updateStatus(newStatus) {
    status.value = newStatus;
  }

  void addUsers() {
    usersCount += 1;
    update(['userscount_widget']);
  }
}
