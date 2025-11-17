import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/meddlewares/Login_meddleware.dart';
import 'package:myproject/views/Favorires_page.dart';
import 'package:myproject/views/Login_page.dart';
import 'package:myproject/views/Signup_page.dart';
import 'package:myproject/views/Update_page.dart';
import 'package:myproject/views/homepages.dart';
import './views/add_page.dart';
import 'Binding/Binding.dart';
final GetStorages=GetStorage();
void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(

        debugShowCheckedModeBanner: false,
         initialBinding:Binding(),
        theme: ThemeData(
          // textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),

        ),

        initialRoute: "/home"
            "",
        getPages: [
          GetPage(name: "/home", page: () => Homepags(),),
          GetPage(name: "/login", page: () => LoginPage(),middlewares:[
            LoginMeddleware(),
          ] ),
          GetPage(name: "/signup", page: () => SignupPage(),),
          GetPage(name: "/addpage", page: () => AddPage(),),
          GetPage(name: "/fav", page: () => FavoriresPage(),),





        ],




      );

  }
  }
