import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/core/style/global_text_style.dart';
import 'package:appifylab/feature/post/view/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostInput extends StatelessWidget {
  const PostInput({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {
                    Get.to(() => CreatePostPage());
                  },
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
}
