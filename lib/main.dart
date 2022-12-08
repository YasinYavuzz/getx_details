import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_class/controller.dart';
import 'package:getx_class/sayfa1.dart';

import 'localization.dart';

void main() async{
  await GetStorage.init(); // Burada get Storage init etmemiz gerekiyor. Burada GetStorage çalıştırıyoruz
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    // sayfa geçişlerinin olması yani contextlere ulaşması için
    // Get material app ile sarıyoruz
    return GetMaterialApp(
      // Dil ayarları için eklememiz gereken bazı ayarlar
      translations: Languages(),
      // locale: const Locale('tr','TR'), => bu bizim local olarak verdiğimiz
      locale: Get.deviceLocale, // bu da cihazın diline göre gelen ayar
      fallbackLocale: const Locale('en','US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  // final String title;

//   RxInt _counter = RxInt(0); 
//  // observable 
//   void _incrementCounter() {
//     _counter.value++; // value içerisindeki değerde işlem yapmak için değişiklik gerektiğinde (type casting)
//     print(_counter); // direk elemanı çağırdığımızda (.value) dememize gerek yok
//   }

  Controller controller = Get.put(Controller()); // bu controlleri ilk tanımladığımız yer

  // Controller controller = Get.find(); // bu controllera herhangi bir yerden tekrar ulaşmak istersek

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get X'),
      ),
      body: Center(
        
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hi'.tr),            
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () =>  Text(
                '${controller.sayac}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(onPressed: () {
            Get.updateLocale(Locale('tr','TR'));
            // Get.to(Sayfa1(),transition: Transition.downToUp);
          }, child: const Text('Dil Değiş')),
            ElevatedButton(onPressed: () {
            // get ile sayfa geçişi
            // animasyonlu geçişte verebiliriz (transition parametresi)
            Get.to(Sayfa1(),transition: Transition.downToUp);
          }, child: const Text('Sayfa 1'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.sayaciArttir,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
