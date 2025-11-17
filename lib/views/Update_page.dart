import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/Controllers/Update_controller.dart';
import 'package:myproject/models/homemodel.dart';

import '../models/app_styles.dart';
import '../Controllers/add_Controller.dart';
class UpdatePage extends StatelessWidget {
  final Homemodel model;
  final controller = Get.find<UpdateController>();

  UpdatePage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    controller.titleController.text=model.notesTitle.toString();
    controller.descriptionController.text=model.notesContent.toString();


    var size = MediaQuery.of(context).size;

    return Scaffold(

        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(accentColor),

            onPressed:() {
              controller.performUpdate(model.notesId);
              controller.clearcontroller();
            },child: Center(child: Text("Update",style: TextStyle(fontSize: 12),),),),
        appBar: AppBar(
          backgroundColor: Color(backgroundColor),
        ),
        body: Obx(() {
          return controller.isLoading == true ? Center(child: CircularProgressIndicator(),):       Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(backgroundColor),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: screenPadding * 3),
                    child: Text("View task", style: TextStyle(fontSize: headline1)),
                  ),


                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft:Radius.circular(40),
                            topRight:Radius.circular(40),


                          ),

                          color: Colors.white

                      ),
                      width: size.width * 0.95,
                      height: size.height*0.98,

                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,

                            // color: Colors.green,

                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.titleController,
                                    decoration: InputDecoration(
                                      label: Text("Title"),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  // color: Colors.red,
                                  margin: EdgeInsetsDirectional.only(
                                    start: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      // 🔹 عرض التاريخ بشكل مباشر ويتحدث تلقائيًا
                                      // 🔹 زر اختيار التاريخ
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                            backgroundColor: Colors.blue,
                                          ),
                                          onPressed: () =>
                                              controller.pickDate(context),
                                          child: FaIcon(
                                            FontAwesomeIcons.calendar,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),

                                      Obx(
                                            () => Text(
                                          controller.selectedDate.value ==
                                              null
                                              ? " ${model.notesdue_date}"
                                              : "${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Container(child: Text('${model.notesdue_date}'),),
                          // Container(child: Text('${model.notescreated_at}'),),


                          Container(
                            // color: Colors.red,
                            width: size.width*0.90,
                            height: size.height*0.70,
                            margin:EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,

                            child:
                            ListView(
                              children: [
                                TextFormField(
                                  controller: controller.descriptionController,
                                  maxLines: 100,
                                  minLines: 2,
                                  decoration: InputDecoration(
                                      label: Text("description:"),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ),

                        ],
                      )
                  ),
                ],
              ),
            ),
          );

        },)

    );
  }
}
