import 'package:get/get.dart';
import 'package:myproject/Controllers/Signup_Controller.dart';
import 'package:myproject/Controllers/Update_controller.dart';
import 'package:myproject/Controllers/login_Controller.dart';
import 'package:myproject/Controllers/add_Controller.dart';
import 'package:myproject/Controllers/Favorites_Controller.dart';

import '../Controllers/Delet_Controller.dart';
import '../Controllers/Home_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() =>SignupController(),fenix: true);
    Get.lazyPut<LoginController>(() =>LoginController(),fenix: true);
    Get.lazyPut<HomeController>(() =>HomeController(),fenix: true);
    Get.lazyPut<AddController>(() =>AddController(),fenix: true);
    Get.lazyPut<UpdateController>(() =>UpdateController(),fenix: true);
    Get.lazyPut<DeletController>(() =>DeletController(),fenix: true);
    Get.lazyPut<FavoriteController>(() =>FavoriteController(),fenix: true);









  }
}