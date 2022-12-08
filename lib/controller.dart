import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController{
  
  RxInt sayac = 0.obs; 
 // observable 

  RxBool isChangeTheme = false.obs; // theme değişiklikleri için dinlenebilir olması gerekli değil
  // o yüzden Rx kullanamaya gerek yok


  GetStorage getStorage = GetStorage();
  // Get birde sharedPreferences yapısı gibi sunduğu bir yapı var GetStorage paketi
  void saveTheme(bool deger){
    getStorage.write('theme', deger);
  }


  void changeThemes() {
    isChangeTheme.value = !isChangeTheme.value;
    isChangeTheme.value == true ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light()); 
    saveTheme(isChangeTheme.value);
  }

  void sayaciArttir() {
    sayac.value++; 
  }

  void sayacAzalt(){
    sayac.value--;
  }
  

  void sayfaGec(){} // sayfayı geçme burada da ayrı bir yerde de tanımlanabilir.

  void snackBar(){} // aynı şekilde sayfada gösterilecek olan snackbar da bu sayfada gösterilebilir.

  // Memory leak => Büyük uygulamalarda 
  
  // initState yerine geçer
  @override
  void onInit() {
    getStorage.read('theme') == true ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light()); 
    print(getStorage.read('theme'));
    super.onInit();
  }
 
  // ondispose yerine geçer
  // controllerları kapatmak için (memory leak) buna göz atayım
  @override
  void onClose() {
    
    super.onClose();
  }


  
}