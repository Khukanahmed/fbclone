import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final int likeCount;
  final int commentCount;

  const PostWidget({
    super.key,
    required this.likeCount,
    required this.commentCount,
  });

  void _showBottomSheet(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type == "like" ? "People who liked this" : "Comments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: type == "like" ? likeCount : commentCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text(
                        type == "like"
                            ? "User ${index + 1} liked this"
                            : "User ${index + 1} commented",
                      ),
                      subtitle:
                          type == "like"
                              ? null
                              : Text("This is a sample comment."),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.thumb_up_alt_outlined),
            onPressed: () => _showBottomSheet(context, "like"),
          ),
          Text("You and $likeCount others"),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.comment_outlined),
            onPressed: () => _showBottomSheet(context, "comment"),
          ),
          Text("$commentCount Comments"),
        ],
      ),
    );
  }
}
