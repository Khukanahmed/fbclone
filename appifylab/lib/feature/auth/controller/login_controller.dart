import 'dart:convert';

import 'package:appifylab/core/nav_bar/nav_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/const/app_texts.dart';
import '../../../core/services_class/local_service/shared_preferences_helper.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> logInGlobalKey = GlobalKey<FormState>();

  String? fcmToken;
  String firebaseEmail = '';
  var isClicked = false.obs;

  void togglePasswordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (email.isEmpty) {
      EasyLoading.showError(AppTexts.emailhint);
      return;
    } else if (!emailRegex.hasMatch(email)) {
      EasyLoading.showError("Invalid email format");
      return;
    } else if (password.isEmpty) {
      EasyLoading.showError(AppTexts.passwordhint);
      return;
    } else if (password.length < 6) {
      EasyLoading.showError("Password must be at least 6 characters");
      return;
    }

    try {
      EasyLoading.show(status: 'Logging in...');
      Map<String, String> requestBody = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
        "app_token": fcmToken.toString(),
      };
      final response = await http.post(
        Uri.parse(
          "https://ezyappteam.ezycourse.com/api/app/student/auth/login",
        ),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: requestBody,
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var token = data['token'];
        Get.offAll(() => NavBar());
        await SharedPreferencesHelper.saveToken(token);
      } else {
        var error = data['msg'];
        EasyLoading.showError("$error");
      }
    } catch (e) {
      EasyLoading.showError('An error occurred. Please try again.');
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      EasyLoading.dismiss();
    }
  }
}
