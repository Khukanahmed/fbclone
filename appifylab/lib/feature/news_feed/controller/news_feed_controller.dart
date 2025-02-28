import 'dart:convert';
import 'package:appifylab/core/services_class/local_service/shared_preferences_helper.dart';
import 'package:appifylab/feature/news_feed/model/comment_model.dart';
import 'package:appifylab/feature/news_feed/model/news_feed_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var newsFeedData = <NewsFeedModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getNewsFeed("2914", "5883");
  }

  Future<void> getNewsFeed(String communityId, String spaceId) async {
    try {
      String? token = await SharedPreferencesHelper.getAccessToken();

      if (token != null) {
        print("Access Token: $token");
      } else {
        print("No token found");
      }

      final response = await http.post(
        Uri.parse(
          'https://iap.ezycourse.com/api/app/teacher/community/getFeed?status=feed',
        ),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer $token",
        },
        body: {"community_id": communityId, "space_id": spaceId},
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);

        var feedList = decodedData;

        if (feedList != null && feedList is List) {
          newsFeedData.value =
              feedList.map((item) {
                return NewsFeedModel(
                  id: item['id'] ?? 0,
                  schoolId: item['school_id'] ?? 0,
                  name: item['name'] ?? '',
                  pic: item['pic'] ?? '',
                  timezone: DateTime.parse(item['publish_date']),
                  likeCount: item['like_count'] ?? 0,
                  commentCount: item['like_count'] ?? 0,
                  feedTxt: item['feed_txt'] ?? '',
                  bgColor: item['bg_color'] ?? "",
                  user: User(
                    id: item['user']['id'] ?? 0,
                    fullName: item['user']['full_name'] ?? '',
                    profilePic: item['user']['profile_pic'] ?? '',
                  ),
                );
              }).toList();
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  var comment = <CommentModel>[].obs;
  Future<List<CommentModel>> getComments(String spaceId) async {
    try {
      String? token = await SharedPreferencesHelper.getAccessToken();

      if (token != null) {
        print("Access Token: $token");
      } else {
        print("No token found");
      }

      final response = await http.get(
        Uri.parse(
          'https://ezyappteam.ezycourse.com/api/app/student/comment/getComment/$spaceId?more=null',
        ),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
      );

      var data = jsonDecode(response.body);

      if (kDebugMode) {
        print("data: $data");
      }

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        comment.value = CommentModel.fromJsonList(response.body);
        return comment;
      } else {
        if (kDebugMode) {
          print("API Error: ${response.statusCode}");
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      return [];
    }
  }
}
