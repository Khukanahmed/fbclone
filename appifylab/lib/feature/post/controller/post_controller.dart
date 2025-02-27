import 'package:appifylab/core/services_class/local_service/shared_preferences_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class CreatePostController extends GetxController {
  var isLoading = false.obs;
  var selectedColor = Rx<Color>(Colors.white);
  final TextEditingController postController = TextEditingController();

  // Post API Function
  Future<void> createPost() async {
    if (postController.text.trim().isEmpty) {
      EasyLoading.showError("Post content cannot be empty!");
      return;
    }
    EasyLoading.showProgress(0.3, status: "Posting...");

    isLoading.value = true;
    String? token = await SharedPreferencesHelper.getAccessToken();

    if (token != null) {
      if (kDebugMode) {
        print("Access Token: $token");
      }
    } else {
      if (kDebugMode) {
        print("No token found");
      }
    }

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          "https://ezyappteam.ezycourse.com/api/app/teacher/community/createFeedWithUpload",
        ),
      );

      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      });

      request.fields['feed_txt'] = postController.text;
      request.fields['community_id'] = "2914";
      request.fields['space_id'] = "5883";
      request.fields['is_background'] = selectedColor.value.value.toString();

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Post created successfully!");
        postController.clear();
        selectedColor.value = Colors.white;

        Get.back();
      } else {
        if (kDebugMode) {
          print("Error response: ${responseData.body}");
        }
        EasyLoading.showError("Failed to create post. Try again!");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong: $e");
    } finally {
      EasyLoading.dismiss();
      isLoading.value = false;
    }
  }
}
