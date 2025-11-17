import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/Srevices/Curd.dart';
import 'package:myproject/Srevices/Links.dart';
import 'package:myproject/main.dart';

class DeletController extends GetxController {
  // متغير مراقب للحالة
  var isLoading = false.obs;

  final Crud _crud = Crud();

  perfordelet(var id) async {
    isLoading.value = true; // بدء التحميل

    final response = await _crud.postrequest(
      linkdelet,
      {
        "id": id.toString(),
      },
    );

    isLoading.value = false; // انتهاء التحميل

    if (response['success'] == true) {
      print(response['message']);

      return response; // ✅ ارجع الـ response كامل
    } else {
      print(response['message']);
    }
    update();
  }
}