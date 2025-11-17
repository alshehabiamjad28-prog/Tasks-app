import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproject/Controllers/Home_controller.dart';
import 'package:myproject/Srevices/Links.dart';
import 'package:myproject/Widgets/Crad_widget.dart';
import 'package:myproject/Widgets/CustomDrawer.dart';
import 'package:myproject/Widgets/Remove_widget.dart';
import 'package:myproject/main.dart';
import 'package:myproject/views/Login_page.dart';
import 'package:myproject/views/Update_page.dart';
import '../Srevices/Curd.dart';
import '../models/app_styles.dart';
import '../models/homemodel.dart';

class Homepags extends StatelessWidget {
  final controller = Get.find<HomeController>();

  Homepags({super.key});

  @override
  Widget build(BuildContext context) {
    var s = GetStorages.write('s', true);
    Homemodel modele;

    var size = MediaQuery.of(context).size;
    return           Scaffold(
      backgroundColor: Color(backgroundColor),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(accentColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        onPressed: () {
          Get.toNamed("/addpage");
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Color(accentColor),
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 30.0),
            child: Icon(FontAwesomeIcons.bookOpen, size: 50),
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
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: screenPadding * 5),
                child: Text(
                  "Tasks",
                  style: TextStyle(fontSize: size.width * 0.060),
                ),
              ),




              FutureBuilder(

                future: controller.performview(),

                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }



                  if (snapshot.hasData) {

                    return ListView.builder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      itemCount: snapshot.data['data'].length,

                      itemBuilder: (context, index) {
                        modele = Homemodel.fromJson(
                          snapshot.data['data'][index],
                        );

                        return cardwidget(
                          model: Homemodel.fromJson(
                            snapshot.data['data'][index],
                          ),
                          onPressed: () => Get.to(
                            UpdatePage(
                              model: Homemodel.fromJson(
                                snapshot.data['data'][index],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loding"));
                  } else {
                    return Center(child: Text("Loding"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}
