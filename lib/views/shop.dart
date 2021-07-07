import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './cart.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('My name is ... ${Get.arguments["name"]}'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back(result: '200');
                },
                child: Text('Go Back')),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Cart());
                },
                child: Text('Open Cart'))
          ],
        ),
      ),
    );
  }
}
