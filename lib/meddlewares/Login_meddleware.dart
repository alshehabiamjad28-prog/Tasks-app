import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../main.dart';

class LoginMeddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // bool? ii = sharedpref?.getBool("i");
    var ii = GetStorages.read("i");

    if (ii == true) {
      return RouteSettings(name: "/home");
    } else if (ii == false) {
      return RouteSettings(name: "/login");
    }
    return null;
  }
}
