
import 'package:ah_store/bindings.dart';
import 'package:ah_store/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{

  //todo make settings model from  resposne https://api-card-store.technorex.net/api/setting
  // todo in Global controller getSettings() and save it















  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansKhojkiTextTheme(),
      ),
      home: AuthView(),
      color: Colors.white10,
    );
  }
}

