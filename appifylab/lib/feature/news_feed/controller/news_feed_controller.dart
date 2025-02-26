import 'package:get/get.dart';

class PostController extends GetxController {
  var posts = [
    {
      "username": "Alexander John",
      "time": "2 days ago",
      "text":
          "Hello everyone, this is a post from the app to see if the attached link is working or not. Here is a link https://www.merriam-webster.com/dictionary/link but I think this is not working.",
      "image": "https://source.unsplash.com/random/400x300", // Sample Image
      "likes": 2,
      "comments": 12
    },
    {
      "username": "Ruiz Rahim",
      "time": "2 days ago",
      "text": "This is a sample test for checking.",
      "image": "",
      "likes": 0,
      "comments": 0
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
