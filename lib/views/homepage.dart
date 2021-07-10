import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/controllers/homeController.dart';

class HomePage extends GetWidget<HomePageController> {
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

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
            Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email Address')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    if (GetUtils.isEmail(emailController.text)) {
                      storage.write('email', emailController.text);
                      emailController.text = '';
                    } else {
                      Get.snackbar(
                          'Something went wrong..', 'Enter a valid email',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.yellow);
                    }
                  },
                  child: Text('Update Email')),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    controller.updateEmail("${storage.read('email')}");
                  },
                  child: Text('View')),
            ),
            Obx(() {
              return Text('Email Address: ${controller.email.value}');
            })
          ],
        ),
      ),
    );
  }
}
