import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  String status =
                      await Get.to(() => Shop(), arguments: {'name': 'Slava'});
                  print(status);
                },
                child: Text('Go to Store!'))
          ],
        ),
      ),
    );
  }
}
