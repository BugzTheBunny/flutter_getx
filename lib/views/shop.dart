import 'package:flutter/material.dart';
import '../controllers/homeController.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  HomePageController home = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop ${home.status}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('My name is ... ${Get.arguments["name"]}'),
            ),
            Container(
              child: Text('Selected Product ${Get.parameters["prodID"]}'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offNamed('/homepage');
                },
                child: Text('Go Back')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/cart');
                },
                child: Text('Open Cart'))
          ],
        ),
      ),
    );
  }
}
