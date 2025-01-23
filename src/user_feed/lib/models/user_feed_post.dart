abstract class UserFeedPost {
  late String? id;
  late bool isVideoPost;
}

class VideoFeedPost extends UserFeedPost {
  String? title;
  String description;
  String? thumbnailUrl;
  String? videoUrl;
  String? createdBy;
  int? createdOn;
  int? updatedOn;
  int? likeCount;
  int? commentCount;
  VideoFeedPost({
    this.title,
    this.description = '',
    this.thumbnailUrl,
    this.videoUrl,
    this.createdBy,
    this.createdOn,
    this.updatedOn,
    this.likeCount,
    this.commentCount,
  });
}

class AdvertisementFeedPost extends UserFeedPost {}
