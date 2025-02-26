import 'dart:async';

import 'package:appifylab/core/nav_bar/nav_bar.dart';
import 'package:appifylab/core/services_class/local_service/shared_preferences_helper.dart';
import 'package:appifylab/route/route.dart';

import 'package:get/get.dart';



class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  

  void checkIsLogin() async {
    Timer(const Duration(seconds: 3), () async {
      bool isLogin = await SharedPreferencesHelper.checkLogin() ?? false;

      if (isLogin) {
        Get.offAll(()=>NavBar()); 
      } else {
        Get.offAllNamed(AppRoute.loginScreen); 
      }
    });
  }


  @override
  void onInit() {
    super.onInit();

    checkIsLogin();
  }

 
}
