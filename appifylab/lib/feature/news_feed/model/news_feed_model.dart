class NewsFeedModel {
  final int? id;
  final int? schoolId;
  final int? userId;
  final dynamic? courseId;
  final int? communityId;
  final dynamic? groupId;
  final String? feedTxt;
  final Status? status;
  final String? slug;
  final String? title;
  final ActivityType? activityType;
  final int? isPinned;
  final FileType? fileType;
  final List<dynamic>? files;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;
  final int? shareId;
  final MetaDataClass? metaData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FeedPrivacy? feedPrivacy;
  final int? isBackground;
  final String? bgColor;
  final dynamic pollId;
  final dynamic lessonId;
  final int? spaceId;
  final dynamic videoId;
  final dynamic streamId;
  final dynamic blogId;
  final dynamic scheduleDate;
  final dynamic timezone;
  final dynamic isAnonymous;
  final dynamic meetingId;
  final dynamic sellerId;
  final DateTime? publishDate;
  final bool? isFeedEdit;
  final String? name;
  final String? pic;
  final int? uid;
  final int? isPrivateChat;
  final dynamic poll;
  final dynamic follow;
  final Like? like;
  final dynamic savedPosts;
  final List<LikeType>? likeType;
  final dynamic group;
  final User? user;
  final List<dynamic>? comments;
  final PurpleMeta? meta;

  NewsFeedModel({
    this.id,
    this.schoolId,
    this.userId,
    this.courseId,
    this.communityId,
    this.groupId,
    this.feedTxt,
    this.status,
    this.slug,
    this.title,
    this.activityType,
    this.isPinned,
    this.fileType,
    this.files,
    this.likeCount,
    required this.commentCount,
    this.shareCount,
    this.shareId,
    this.metaData,
    this.createdAt,
    this.updatedAt,
    this.feedPrivacy,
    this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    this.publishDate,
    this.isFeedEdit,
    this.name,
    this.pic,
    this.uid,
    this.isPrivateChat,
    this.poll,
    this.follow,
    this.like,
    this.savedPosts,
    this.likeType,
    this.group,
    this.user,
    this.comments,
    this.meta,
  });

  NewsFeedModel copyWith({
    int? id,
    int? schoolId,
    int? userId,
    dynamic courseId,
    int? communityId,
    dynamic groupId,
    String? feedTxt,
    Status? status,
    String? slug,
    String? title,
    ActivityType? activityType,
    int? isPinned,
    FileType? fileType,
    List<dynamic>? files,
    int? likeCount,
    int? commentCount,
    int? shareCount,
    int? shareId,
    MetaDataClass? metaData,
    DateTime? createdAt,
    DateTime? updatedAt,
    FeedPrivacy? feedPrivacy,
    int? isBackground,
    String? bgColor,
    dynamic pollId,
    dynamic lessonId,
    int? spaceId,
    dynamic videoId,
    dynamic streamId,
    dynamic blogId,
    dynamic scheduleDate,
    dynamic timezone,
    dynamic isAnonymous,
    dynamic meetingId,
    dynamic sellerId,
    DateTime? publishDate,
    bool? isFeedEdit,
    String? name,
    String? pic,
    int? uid,
    int? isPrivateChat,
    dynamic poll,
    dynamic follow,
    Like? like,
    dynamic savedPosts,
    List<LikeType>? likeType,
    dynamic group,
    User? user,
    List<dynamic>? comments,
    PurpleMeta? meta,
  }) => NewsFeedModel(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    userId: userId ?? this.userId,
    courseId: courseId ?? this.courseId,
    communityId: communityId ?? this.communityId,
    groupId: groupId ?? this.groupId,
    feedTxt: feedTxt ?? this.feedTxt,
    status: status ?? this.status,
    slug: slug ?? this.slug,
    title: title ?? this.title,
    activityType: activityType ?? this.activityType,
    isPinned: isPinned ?? this.isPinned,
    fileType: fileType ?? this.fileType,
    files: files ?? this.files,
    likeCount: likeCount ?? this.likeCount,
    commentCount: commentCount ?? this.commentCount,
    shareCount: shareCount ?? this.shareCount,
    shareId: shareId ?? this.shareId,
    metaData: metaData ?? this.metaData,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    feedPrivacy: feedPrivacy ?? this.feedPrivacy,
    isBackground: isBackground ?? this.isBackground,
    bgColor: bgColor ?? this.bgColor,
    pollId: pollId ?? this.pollId,
    lessonId: lessonId ?? this.lessonId,
    spaceId: spaceId ?? this.spaceId,
    videoId: videoId ?? this.videoId,
    streamId: streamId ?? this.streamId,
    blogId: blogId ?? this.blogId,
    scheduleDate: scheduleDate ?? this.scheduleDate,
    timezone: timezone ?? this.timezone,
    isAnonymous: isAnonymous ?? this.isAnonymous,
    meetingId: meetingId ?? this.meetingId,
    sellerId: sellerId ?? this.sellerId,
    publishDate: publishDate ?? this.publishDate,
    isFeedEdit: isFeedEdit ?? this.isFeedEdit,
    name: name ?? this.name,
    pic: pic ?? this.pic,
    uid: uid ?? this.uid,
    isPrivateChat: isPrivateChat ?? this.isPrivateChat,
    poll: poll ?? this.poll,
    follow: follow ?? this.follow,
    like: like ?? this.like,
    savedPosts: savedPosts ?? this.savedPosts,
    likeType: likeType ?? this.likeType,
    group: group ?? this.group,
    user: user ?? this.user,
    comments: comments ?? this.comments,
    meta: meta ?? this.meta,
  );
}

enum ActivityType { GROUP }

enum FeedPrivacy { PUBLIC }

enum FileType { TEXT }

class Like {
  final int id;
  final int feedId;
  final int userId;
  final String reactionType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int isAnonymous;
  final MetaDataClass meta;

  Like({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.reactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
    required this.meta,
  });

  Like copyWith({
    int? id,
    int? feedId,
    int? userId,
    String? reactionType,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isAnonymous,
    MetaDataClass? meta,
  }) => Like(
    id: id ?? this.id,
    feedId: feedId ?? this.feedId,
    userId: userId ?? this.userId,
    reactionType: reactionType ?? this.reactionType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isAnonymous: isAnonymous ?? this.isAnonymous,
    meta: meta ?? this.meta,
  );
}

class MetaDataClass {
  MetaDataClass();

  MetaDataClass copyWith() => MetaDataClass();
}

class LikeType {
  final String reactionType;
  final int feedId;
  final MetaDataClass meta;

  LikeType({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  LikeType copyWith({String? reactionType, int? feedId, MetaDataClass? meta}) =>
      LikeType(
        reactionType: reactionType ?? this.reactionType,
        feedId: feedId ?? this.feedId,
        meta: meta ?? this.meta,
      );
}

class PurpleMeta {
  final int views;

  PurpleMeta({required this.views});

  PurpleMeta copyWith({int? views}) => PurpleMeta(views: views ?? this.views);
}

enum Status { APPROVED }

class User {
  final int ?id;
  final String ?fullName;
  final String ?profilePic;
  final int ?isPrivateChat;
  final dynamic ?expireDate;
  final String ?status;
  final dynamic ?pauseDate;
  final UserType ?userType;
  final MetaDataClass? meta;

  User({
     this.id,
     this.fullName,
     this.profilePic,
     this.isPrivateChat,
     this.expireDate,
     this.status,
     this.pauseDate,
     this.userType,
     this.meta,
  });

  User copyWith({
    int? id,
    String? fullName,
    String? profilePic,
    int? isPrivateChat,
    dynamic expireDate,
    String? status,
    dynamic pauseDate,
    UserType? userType,
    MetaDataClass? meta,
  }) => User(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    profilePic: profilePic ?? this.profilePic,
    isPrivateChat: isPrivateChat ?? this.isPrivateChat,
    expireDate: expireDate ?? this.expireDate,
    status: status ?? this.status,
    pauseDate: pauseDate ?? this.pauseDate,
    userType: userType ?? this.userType,
    meta: meta ?? this.meta,
  );
}

enum UserType { STUDENT }
