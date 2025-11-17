
// كلاس منفصل لكل عنصر في الدراور
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/app_styles.dart';

class DrawerItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: buttonRadius/2),
      child: ListTile(
        leading: FaIcon(icon, color: Color(accentColor), size: 20),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hoverColor: Colors.blueAccent.withOpacity(0.1),
      ),
    );
  }
}