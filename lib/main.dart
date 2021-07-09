import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/homepage.dart';
import './views/shop.dart';
import './views/cart.dart';

void main() {
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
          name: '/homepage',
          page: () => HomePage(),
        ),
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
