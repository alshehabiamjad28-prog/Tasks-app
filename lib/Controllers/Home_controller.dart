import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/Srevices/Curd.dart';
import 'package:myproject/Srevices/Links.dart';
import 'package:myproject/main.dart';

class HomeController extends GetxController {
  // متغير مراقب للحالة
  var isLoading = false.obs;



  final Crud _crud = Crud();

    performview() async {

      isLoading.value = true; // بدء التحميل

    final response = await _crud.postrequest(
      linkview,
      {
        "id": GetStorages.read('userid'),
      },
    );

    isLoading.value = false; // انتهاء التحميل

    if (response['success'] == true) {
      print(response['message']);
      return response; // ✅ ارجع الـ response كامل
    } else {
      print(response['message']);
      return {"success": false, "data": []}; // ✅ ارجع Map حتى عند الفشل
    }

  }
}