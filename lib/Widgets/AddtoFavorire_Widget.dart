import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/Controllers/Favorites_Controller.dart';
import 'package:myproject/models/homemodel.dart';


class AddtofavorireWidget extends StatelessWidget {
  final Homemodel model;
  // final HomeController controller2 = Get.find<HomeController>();
  final controller=Get.find<FavoriteController>();



  AddtofavorireWidget({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading == true ? Center(child: CircularProgressIndicator(),) :      Container(
        child:   IconButton(
          icon:  Icon(
           controller.isFavorite(model.notesId.toString()) ?FontAwesomeIcons.heart : Icons.favorite,color: Colors.red,
            size: 20,
          ),
          onPressed:() async{
            if(controller.isFavorite(model.notesId.toString())){
              Get.snackbar("", "err");
            }else{
              controller.addFavorite(model.notesId.toString(), model.notesUsers.toString());
              Get.snackbar("", "add");


            }

          },
        ),
      );


    },);

  }
}
