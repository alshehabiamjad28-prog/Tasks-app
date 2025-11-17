import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:myproject/Srevices/Curd.dart';
import 'package:myproject/Srevices/Links.dart';
import 'package:myproject/main.dart';
import 'package:myproject/models/usermodel.dart';

class UpdateController extends GetxController {
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void clearcontroller(){
    titleController.clear();
    descriptionController.clear();

  }


  // 1️⃣ متغير لتخزين التاريخ
// 🔹 متغير لتخزين التاريخ بشكل مراقب
  var selectedDate = Rxn<DateTime>();
// 2️⃣ دالة لفتح الـ DatePicker
  Future<void> pickDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (picked != null) {
      selectedDate.value = picked; // تخزين التاريخ
    }
  }

   performUpdate(var id) async {
     if (selectedDate == null) {
       Get.snackbar("خطأ", "يرجى اختيار تاريخ المهمة");
     }
    isLoading.value = true; // بدء التحميل

    final response = await _crud.postrequest(
      linkupdate,
      {
        "title": titleController.text,
        "content": descriptionController.text,
        "id":id.toString(),
        "dd": selectedDate.value!.toIso8601String().toString(),

      },
    );

    isLoading.value = false; // انتهاء التحميل

    if (response['success'] == true) {
      Get.snackbar("نجاح", "");
      Get.toNamed('/home');

    } else {
      Get.snackbar("خطأ", response['message']);
    }

  }
}
