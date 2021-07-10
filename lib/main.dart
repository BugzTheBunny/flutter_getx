import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/homepage.dart';
import './views/shop.dart';
import './views/cart.dart';
import 'bindings/homeBindings.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/store',
          page: () => Shop(),
        ),
        GetPage(
          name: '/store/:prodID',
          page: () => Shop(),
        ),
        GetPage(
            name: '/homepage', page: () => HomePage(), binding: HomeBinding()),
        GetPage(
          name: '/cart',
          page: () => Cart(),
        )
      ],
      initialRoute: '/homepage',
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
