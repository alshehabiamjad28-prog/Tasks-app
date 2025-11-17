import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/main.dart';
import 'package:myproject/views/Favorires_page.dart';

import 'DrawerItems_widget.dart' show DrawerItemWidget;
import '../models/app_styles.dart';

// الكلاس الرئيسي للدراور
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250, // عرض نحيف واحترافي
      backgroundColor: Colors.white,
      child: Column(
        spacing: 20,
        children: [
          // شعار التطبيق في الأعلى
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(accentColor),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.bookOpen,
                      size: 35,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // قائمة العناصر
          Expanded(
            child: ListView(

              padding: EdgeInsets.zero,
              children: [
                DrawerItemWidget(
                  icon: FontAwesomeIcons.home,
                  title: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    // Add navigation here
                  },
                ),

                DrawerItemWidget(
                  icon: FontAwesomeIcons.user,
                  title: "Profile",
                  onTap: () {},
                ),
                DrawerItemWidget(
                  icon: FontAwesomeIcons.cog,
                  title: "Settings",
                  onTap: () {},
                ),
                DrawerItemWidget(
                  icon: FontAwesomeIcons.infoCircle,
                  title: "About",
                  onTap: () {},
                ),

                DrawerItemWidget(
                  icon:Icons.favorite,
                  title: "Favorites",
                  onTap: () {

                    Get.off(FavoriresPage());
                  },
                ),

                DrawerItemWidget(
                  icon: FontAwesomeIcons.signOutAlt,
                  title: "Logout",
                  onTap: () {
                    GetStorages.remove('i');
                    GetStorages.remove('userid');
                     Get.offNamed("/login");

                  },
                ),
              ],
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
