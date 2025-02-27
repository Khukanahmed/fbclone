import 'dart:convert';

import 'package:appifylab/core/services_class/local_service/shared_preferences_helper.dart';
import 'package:appifylab/feature/news_feed/model/news_feed_model.dart';
import 'package:flutter/material.dart';
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

  var posts =
      [
        {
          "username": "Alexander John",
          "time": "2 days ago",
          "text":
              "Hello everyone, this is a post from the app to see if the attached link is working or not. Here is a link https://www.merriam-webster.com/dictionary/link but I think this is not working.",
          "image": "https://source.unsplash.com/random/400x300", // Sample Image
          "likes": 2,
          "comments": 12,
        },
        {
          "username": "Ruiz Rahim",
          "time": "2 days ago",
          "text": "This is a sample test for checking.",
          "image": "",
          "likes": 0,
          "comments": 0,
        },
      ].obs;

  void likePost(int index) {
    posts[index]["likes"] = (posts[index]["likes"] as int) + 1;
    posts.refresh(); // Update UI
  }

  void commentOnPost(int index) {
    posts[index]["comments"] = (posts[index]["comments"] as int) + 1;
    posts.refresh();
  }
}
