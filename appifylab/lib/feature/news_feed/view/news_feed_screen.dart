import 'dart:convert';
import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/core/style/global_text_style.dart';
import 'package:appifylab/feature/news_feed/controller/news_feed_controller.dart';
import 'package:appifylab/feature/news_feed/widget/comment_screen.dart';
import 'package:appifylab/feature/news_feed/widget/post_input.dart';
import 'package:flutter/foundation.dart';
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

          PostInput(),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: postController.newsFeedData.length,
                itemBuilder: (context, index) {
                  var post = postController.newsFeedData[index];
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-1.0, 0.0),
                        end: Alignment(1.0, 0.0),
                        transform: GradientRotation(90),
                        colors: extractGradientColors(post.bgColor ?? ""),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                  post.user?.profilePic ?? '',
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.name ?? "Unknown",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    getTimeAgo(post.timezone),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Linkify(
                            onOpen: (link) async {
                              if (await canLaunch(link.url)) {
                                await launch(link.url);
                              }
                            },
                            text: post.feedTxt ?? "",
                            style: TextStyle(fontSize: 14),
                            linkStyle: TextStyle(color: Colors.blue),
                          ),
                          if (post.pic != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  post.pic ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up_alt_outlined),
                                onPressed: () {},
                              ),
                              Text("You and ${post.likeCount} other"),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.comment_outlined),
                                onPressed: () {
                                  postController.getComments(
                                    post.id.toString(),
                                  );

                                  _showPostDetails(context, post.id.toString());
                                },
                              ),
                              Text("${post.commentCount} Comments"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getTimeAgo(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inDays > 0) {
    return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
  } else {
    return "Just now";
  }
}

List<Color> extractGradientColors(String bgColor) {
  try {
    String cleanedBgColor = bgColor.replaceAll("\"", "");
    Map<String, dynamic> bgColorJson = jsonDecode(cleanedBgColor);
    String gradientString = bgColorJson["backgroundImage"];

    RegExp regex = RegExp(r"rgb\((\d+), (\d+), (\d+)\)");
    Iterable<Match> matches = regex.allMatches(gradientString);

    List<Color> colors =
        matches.map((match) {
          return Color.fromRGBO(
            int.parse(match.group(1)!),
            int.parse(match.group(2)!),
            int.parse(match.group(3)!),
            1.0,
          );
        }).toList();

    return colors;
  } catch (e) {
    if (kDebugMode) {
      print("Error parsing gradient: $e");
    }
    return [Colors.white, Colors.white];
  }
}

void _showPostDetails(BuildContext context, String postId) {
  final PostController postController = Get.find<PostController>();

  // Fetch comments for the specific post before showing the details.
  postController
      .getComments(postId)
      .then((comments) {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Display the list of comments
                  Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        var comment = comments[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              comment.user.profilePic,
                            ),
                          ),
                          title: Text(comment.user.fullName),
                          subtitle: Text(comment.commentTxt),
                          trailing: Text(
                            getTimeAgo(DateTime.parse(comment.createdAt)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      })
      .catchError((e) {
        print("Error fetching comments: $e");
      });
}
