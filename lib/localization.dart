import 'package:get/get.dart';

class Languages extends Translations{

  // Dilleri ekliyoruz
  // eklemek istediğimiz dilleri tek tek giriyoruz 
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US" : {
      'hi' : 'Hello World',
      'language' : 'language changed'
    },
    
    "tr_TR" : {
      'hi' : 'Merhaba Dünya',
      'dil' : 'language changed'
    }
  };

}