import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproject/Controllers/login_Controller.dart';
import 'package:myproject/Widgets/TextFormfield.dart';
import 'package:myproject/models/app_styles.dart';

class LoginPage extends StatelessWidget {


   LoginPage({super.key});
   final controller = Get.find<LoginController>();


   @override
  Widget build(BuildContext context) {
     var args=Get.arguments;

     if(args!=null){
       controller.emailFieldController.text=args['email'].toString();
       controller.passwordFieldController.text=args['password'].toString();

     }



     return Scaffold(
      backgroundColor: Colors.white,


      body: Obx(() {
        return controller.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Container(
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(accentColor).withOpacity(0.1),
                        shape: BoxShape.circle
                    ),
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: 120,
                    height: 150,
                    child: Icon(
                      FontAwesomeIcons.bookOpen,
                      size: 80,
                      color: Color(primaryColor),
                    ),
                  ),

                  SizedBox(height: 38.0),
                  Text(
                    "Signin",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(textPrimaryColor),
                    ),
                  ),
                  SizedBox(height: 38.0),
                  Textformfield(

                    validator: controller.validateEmail,
                    controller: controller.emailFieldController,
                    hint: 'Email',
                    leading: Icons.email_outlined,
                  ),
                  Textformfield(
                    validator: controller.validatePassword,
                    controller: controller.passwordFieldController,
                    hint: 'Password',
                    leading: Icons.lock_outline_rounded,
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: controller.performSignup,
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.blue],
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account?",
                          style: TextStyle(
                            color: Color(textSecondaryColor),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed("/signup"),
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }),


    );
  }
}
