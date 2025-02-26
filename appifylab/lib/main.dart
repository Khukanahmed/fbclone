import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  configEasyLoading();
  runApp(const MyApp());
}

void configEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.grayColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  final String? savedLocale;
  @override
  const MyApp({super.key, this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AppifyLab',
            getPages: AppRoute.routes,
            initialRoute: AppRoute.splashScreen,
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffF1F1F3),
              appBarTheme: AppBarTheme(backgroundColor: Color(0xffF1F1F3)),
            ),
            //initialBinding: MainPageBinding(),
            builder: EasyLoading.init(),
          ),
    );
  }
}
