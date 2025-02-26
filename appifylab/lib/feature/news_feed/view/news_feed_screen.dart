import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/core/style/global_text_style.dart';
import 'package:appifylab/feature/news_feed/controller/news_feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset('assets/images/menu.png', height: 30),

                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Python Developer Community',
                        style: globalTextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '#General',
                        style: globalTextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          _buildPostInputField(),
          Expanded(child: _buildPostList()),
        ],
      ),
    );
  }

  Widget _buildPostInputField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person_rounded, size: 45),
                ),
              ),

              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write Something here...",

                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Post",
                  style: globalTextStyle(color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: postController.posts.length,
        itemBuilder: (context, index) {
          var post = postController.posts[index];
          return _buildPostCard(post, index);
        },
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostHeader(post),
            SizedBox(height: 10),
            _buildPostContent(post),
            if (post["image"] != null && post["image"].isNotEmpty)
              _buildPostImage(post["image"]),
            _buildPostActions(post, index),
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader(Map<String, dynamic> post) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post["username"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              post["time"],
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  Widget _buildPostContent(Map<String, dynamic> post) {
    return Linkify(
      onOpen: (link) async {
        if (await canLaunch(link.url)) {
          await launch(link.url);
        }
      },
      text: post["text"],
      style: TextStyle(fontSize: 14),
      linkStyle: TextStyle(color: Colors.blue),
    );
  }

  Widget _buildPostImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildPostActions(Map<String, dynamic> post, int index) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.thumb_up_alt_outlined),
          onPressed: () => postController.likePost(index),
        ),
        Text("You and ${post["likes"]} other"),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.comment_outlined),
          onPressed: () => postController.commentOnPost(index),
        ),
        Text("${post["comments"]} Comments"),
      ],
    );
  }
}
