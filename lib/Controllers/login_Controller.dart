import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/Srevices/Curd.dart';
import 'package:myproject/Srevices/Links.dart';
import 'package:myproject/main.dart';
import 'package:myproject/models/usermodel.dart';
import 'package:myproject/views/homepages.dart';

class LoginController extends GetxController {
  // متغير مراقب للحالة
  var isLoading = false.obs;
  late model models;
@override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  final Crud _crud = Crud();

  // Controllers لحقول الإدخال
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // دوال التحقق
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "البريد الإلكتروني مطلوب";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "كلمة المرور مطلوبة";
    }
    if (value.length < 6) {
      return "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
    }
    return null;
  }

  // دالة التسجيل
  Future<void> performSignup() async {
    if (signupFormKey.currentState!.validate()) {
      isLoading.value = true; // بدء التحميل

      final response = await _crud.postrequest(
        linklogin,
        {
          "email": emailFieldController.text,
          "password": passwordFieldController.text,
        },
      );

      isLoading.value = false; // انتهاء التحميل

      if (response['success'] == true) {
        Get.snackbar("نجاح", "تم إنشاء الحساب بنجاح");
        Get.off(Homepags());
        GetStorages.write('i', true);

        models=model.fromJson(response['data']);
        GetStorages.write('userid', models.id.toString());

        GetStorages.write('email', models.email);
        GetStorages.write('password', models.password);

      } else {
        Get.snackbar("خطأ", response['message']);
      }
    }
  }
}
