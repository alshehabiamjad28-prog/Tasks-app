import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myproject/Widgets/AddtoFavorire_Widget.dart';
import 'package:myproject/Widgets/Remove_widget.dart';
import 'package:myproject/models/homemodel.dart';

import '../models/app_styles.dart';

class cardwidget extends StatelessWidget {
   final  Homemodel model;
  final  void Function()? onPressed;




  const cardwidget({
    super.key, required this.model, this.onPressed,


  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),

          )
        ),
        height: 90,
        margin: EdgeInsets.symmetric(horizontal: cardRadius),
        child: Row(
          children: [
            /// اسم الملاحظة (اليسار)
            Expanded(
              child: Text(
                "${model.notesTitle}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
              child: Text(
                "${model.notesdue_date}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),



            /// أزرار التعديل والحذف (يمين)
            Row(
              children: [
                AddtofavorireWidget(model: model),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.penToSquare,
                    color: Colors.blueAccent,
                    size: 20,
                  ), onPressed:onPressed
                ),
                
                RemoveWidget(model: model)



              ],
            ),
          ],
        ),
      ),
    );
  }
}