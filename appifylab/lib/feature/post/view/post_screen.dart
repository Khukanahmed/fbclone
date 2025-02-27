import 'package:appifylab/feature/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostPage extends StatelessWidget {
  final List<Color> colorOptions = [
    Colors.white,
    Colors.pinkAccent,
    Colors.lightGreen,
    Colors.amber,
    Colors.redAccent,
    Colors.lightBlueAccent,
  ];

  CreatePostPage({super.key});

  final CreatePostController controller = Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text('Create Post', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.createPost();
            },
            child: Text(
              'Create',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: controller.selectedColor.value,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: controller.postController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: "What's on your mind?",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Select Background Color:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  colorOptions.map((color) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedColor.value = Color(color.value);
                      },
                      child: Obx(
                        () => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: color,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color:
                                  controller.selectedColor.value == color
                                      ? Colors.black
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
