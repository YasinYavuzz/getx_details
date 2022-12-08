import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_class/controller.dart';
import 'package:getx_class/sayfa1.dart';

void main() async{
  await GetStorage.init(); // Burada get Storage init etmemiz gerekiyor.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    // sayfa geçişlerinin olması yani contextlere ulaşması için
    // Get material app ile sarıyoruz
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});

  final String title;

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
        title: Text(title),
      ),
      body: Center(
        
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
