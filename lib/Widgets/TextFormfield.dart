

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/models/app_styles.dart';

class Textformfield extends StatelessWidget {

  final String? Function(String?)? validator;
 final void Function()? onTap;
  final TextEditingController? controller;
  final hint;
  final leading;

  const Textformfield({super.key, this.hint, this.leading, this.controller, this.onTap, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 50,bottom: 30),
          
      child: Center(
        child: SizedBox(

          child: TextFormField(

            // textAlignVertical: TextAlignVertical.center,
            validator: validator,
            onTap: onTap,


            maxLines: 2,

            controller:controller ,
           decoration:InputDecoration(






             prefixIcon:Icon(leading,color:Color(secondaryColor)) ,
             suffixIconColor: Colors.blueAccent,



             labelText: hint,

             alignLabelWithHint: false,



             filled: true,
             fillColor: Color(0xa5f5f5f5),
             border: OutlineInputBorder(

               // borderRadius: BorderRadius.all(Radius.circular(10.0)),

             ),
             enabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Color(primaryColor))

             ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(primaryColor))

              )

           ) ,




              ),
        ),
      ),);
  }
}





