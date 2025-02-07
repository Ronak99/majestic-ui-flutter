import '../data/data.dart';
import '../models/user_feed_post.dart';

class VideoService {
  Future<List<VideoFeedPost>> fetchUserFeedQuery({
    required int limit,
    VideoFeedPost? after,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return userFeed;
  }
}
