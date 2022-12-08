
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
class Sayfa1 extends StatelessWidget {
Sayfa1({super.key});

  Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>Text('${controller.sayac}')),
            ElevatedButton(onPressed: () {
              controller.sayac.value --;
            }, child: const Text('Azalt')),
            ElevatedButton(onPressed: () {
              Get.back();
            }, child: const Text('Geri Dön')),
            ElevatedButton(onPressed: () {
              Get.snackbar('asda', 'dkfjgkldjgkldfjglkdfjglkdf');
            }, child: const Text('Snackbar')),
            ElevatedButton(onPressed: () {
              Get.dialog(const Text('data'));
            }, child: const Text('Dialog')),
            ElevatedButton(onPressed: () {
              Get.defaultDialog(
                title: 'asdasd',
                middleText: 'adasddfsdfsdfsdf',
                confirmTextColor: Colors.red);
            }, child: const Text('DefaultDialog')),
            ElevatedButton(onPressed: () {
              // Get.changeTheme(controller.isChangeTheme.value ? ThemeData.dark() : ThemeData.light()); // direk olarak value demezsek hata veriyor tip hatası
              controller.changeThemes();
            }, child: const Text('Change Theme')),
          ],
        ),
      )
    );
  }
}