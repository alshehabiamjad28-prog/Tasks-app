import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/models/homemodel.dart';

import '../Controllers/Delet_Controller.dart';
import '../Controllers/Home_controller.dart';

class RemoveWidget extends StatelessWidget {
  final Homemodel model;
  final controller=Get.find<DeletController>();
  final HomeController controller2 = Get.find<HomeController>();


  RemoveWidget({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading == true ? Center(child: CircularProgressIndicator(),) :      Container(
        child:   IconButton(
          icon: const Icon(
            FontAwesomeIcons.trash,
            color: Colors.redAccent,
            size: 20,
          ),
          onPressed:() async{


            await controller.perfordelet(model.notesId);
          },
        ),
      );


    },);

  }
}
