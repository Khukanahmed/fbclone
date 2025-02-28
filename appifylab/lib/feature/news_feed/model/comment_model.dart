import 'dart:convert';

class CommentModel {
  final int id;
  final int schoolId;
  final int feedId;
  final int userId;
  final int replyCount;
  final int likeCount;
  final String commentTxt;
  final String createdAt;
  final String updatedAt;
  final String? file;
  final UserModel user;

  CommentModel({
    required this.id,
    required this.schoolId,
    required this.feedId,
    required this.userId,
    required this.replyCount,
    required this.likeCount,
    required this.commentTxt,
    required this.createdAt,
    required this.updatedAt,
    this.file,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      schoolId: json['school_id'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      replyCount: json['reply_count'],
      likeCount: json['like_count'],
      commentTxt: json['comment_txt'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      file: json['file'],
      user: UserModel.fromJson(json['user']),
    );
  }

  static List<CommentModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => CommentModel.fromJson(json)).toList();
  }
}

class UserModel {
  final int id;
  final String fullName;
  final String profilePic;
  final String userType;

  UserModel({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.userType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      userType: json['user_type'],
    );
  }
}
