import 'package:flutter/material.dart';
import '../controllers/homeController.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomePageController homepageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  String status =
                      await Get.toNamed('/store', arguments: {'name': 'Slava'});
                },
                child: Text('Go to Store!')),
            ElevatedButton(
                onPressed: () async {
                  Get.toNamed('/store/MacBook', arguments: {'name': 'Slava'});
                },
                child: Text('Show Macbook!')),
            Obx(() {
              print('STATUS REBUILD');
              return Text("User Status :${homepageController.status.value}");
            }),
            ElevatedButton(
                onPressed: () {
                  homepageController.updateStatus("Online!");
                },
                child: Text('Login In')),
            ElevatedButton(
                onPressed: () {
                  homepageController.updateStatus("Offline!");
                },
                child: Text('Log Out')),
            Obx(() {
              return Text(
                  "Users Count :${homepageController.usersCount.value}");
            }),
            ElevatedButton(
                onPressed: () {
                  homepageController.addUsers();
                },
                child: Text('Add Users')),
          ],
        ),
      ),
    );
  }
}
