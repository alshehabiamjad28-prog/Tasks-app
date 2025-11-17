import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproject/Controllers/Favorites_Controller.dart';
import 'package:myproject/Widgets/Card.dart';
import 'package:myproject/Widgets/CustomDrawer.dart';
import 'package:myproject/main.dart';
import 'package:myproject/models/FavoriteModel.dart';
import '../models/app_styles.dart';

class FavoriresPage extends StatelessWidget {
  final controller = Get.find<FavoriteController>();

  FavoriresPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getFavorites(GetStorages.read('userid'));
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(backgroundColor),
      appBar: AppBar(
        backgroundColor: Color(accentColor),
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 30.0),
            child: const Icon(FontAwesomeIcons.bookOpen, size: 50),
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: screenPadding * 5),
                child: Text(
                  "Favorites",
                  style: TextStyle(fontSize: size.width * 0.060),
                ),
              ),

              /// هنا يبدأ عرض البيانات
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.favorites.isEmpty) {
                  return const Center(child: Text("لا توجد مهام مضافة في المفضلة"));
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.favorites.length,
                  itemBuilder: (context, index) {
                    final fav = controller.favorites[index];


                    return Cards(title: "${fav.title}",date: "${fav.dueDate}",);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}