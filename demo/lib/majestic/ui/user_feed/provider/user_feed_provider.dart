import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';
import 'dart:collection';

import '../models/user_feed_post.dart';
import '../services/ad_service.dart';
import '../services/video_control_service.dart';
import '../services/video_service.dart';

class UserFeedProvider extends ChangeNotifier {
  // services
  final VideoService _videoService = VideoService();
  final AdService _adService = AdService();

  // state

  final List<UserFeedPost> _feed = [];
  final Map<int, VideoPlayerController> _controllerCache = {};
  final Queue<int> _preloadQueue = Queue();
  final PageController feedController = PageController();
  final PageStorageBucket feedBucket = PageStorageBucket();

  final List<AdvertisementFeedPost> _activeAds = [];

  VideoFeedPost? _lastVideoPost;
  int _currentAdIndex = 0;
  bool _isInitializingFeed = true;
  int _currentIndex = 0;

  static const int BATCH_SIZE = 20;
  static const int AD_INTERVAL = 1;
  static const int FETCH_THRESHOLD = 15;
  static const int MAX_CACHED_CONTROLLERS = 6;
  static const int PRELOAD_COUNT = 6;

  // Getters
  List<UserFeedPost> get feed => UnmodifiableListView(_feed);
  bool get isInitializingFeed => _isInitializingFeed;
  int get currentIndex => _currentIndex;
  VideoPlayerController? getController(int index) {
    final post = _feed[index];
    return (post is VideoFeedPost) ? _controllerCache[index] : null;
  }

  bool get isEmpty => _feed.isEmpty;

  Future<void> initialize() async {
    await _fetchActiveAds();
    await _loadInitialVideos();
  }

  Future<void> _fetchActiveAds() async {
    // try {
    //   final querySnapshot = await _adService.queryAllActiveAds();

    //   _activeAds = querySnapshot.docs.map((doc) => doc.data()).toList();
    // } catch (e) {
    //   print('Error fetching ads: $e');
    //   _activeAds = [];
    // }
  }

  AdvertisementFeedPost? _getNextAd() {
    if (_activeAds.isEmpty) return null;
    final ad = _activeAds[_currentAdIndex];
    _currentAdIndex = (_currentAdIndex + 1) % _activeAds.length;
    return ad;
  }

  void _insertAds(List<VideoFeedPost> videos) {
    int feedIndex = _feed.length;
    for (var video in videos) {
      _feed.add(video);
      // Insert ad after every AD_INTERVAL videos
      if ((feedIndex + 1) % AD_INTERVAL == 0) {
        final ad = _getNextAd();
        if (ad != null) {
          _feed.add(ad);
        }
      }
      feedIndex++;
    }
  }

  Future<void> _loadInitialVideos() async {
    try {
      var userFeedQuery =
          await _videoService.fetchUserFeedQuery(limit: BATCH_SIZE);

      if (userFeedQuery.isNotEmpty) {
        _lastVideoPost = userFeedQuery.last;
        final videos = userFeedQuery;
        _insertAds(videos);

        await _initializeCurrentController();
      }
    } catch (e) {
      print('Error loading initial videos: $e');
    }

    _isInitializingFeed = false;
    notifyListeners();
  }

  Future<void> loadMoreVideos() async {
    if (_isInitializingFeed || _lastVideoPost == null) return;
    try {
      var userFeedQuery = await _videoService.fetchUserFeedQuery(
        limit: BATCH_SIZE,
        after: _lastVideoPost,
      );

      if (userFeedQuery.isNotEmpty) {
        _lastVideoPost = userFeedQuery.last;
        final videos = userFeedQuery;
        _insertAds(videos);
      }
    } catch (e) {
      print('Error loading more videos: $e');
    }
  }

  void jumpToTop() {
    feedController.jumpToPage(0);
  }

  Future<void> refreshFeed() async {
    try {
      _isInitializingFeed = true;
      notifyListeners();

      // Refresh ads first
      await _fetchActiveAds();
      _currentAdIndex = 0;

      // Clear existing data
      _feed.clear();
      _controllerCache.clear();
      _currentIndex = 0;
      _lastVideoPost = null;

      // Get fresh videos
      var userFeedQuery = await _videoService.fetchUserFeedQuery(
        limit: BATCH_SIZE,
        after: _lastVideoPost,
      );

      if (userFeedQuery.isNotEmpty) {
        _lastVideoPost = userFeedQuery.last;
        final videos = userFeedQuery;
        _insertAds(videos);
      }

      // Initialize first video if it exists
      if (_feed.isNotEmpty) {
        await _initializeCurrentController();
      }

      _isInitializingFeed = false;
      notifyListeners();
    } catch (e) {
      print('Error refreshing feed: $e');
      _isInitializingFeed = false;
      notifyListeners();
    }
  }

  Future<void> _initializeCurrentController() async {
    await _initializeController(_currentIndex);
    _preloadNextVideos(_currentIndex);
  }

  Future<void> _initializeController(int index) async {
    final post = _feed[index];
    if (post is! VideoFeedPost) return;

    if (_controllerCache.containsKey(index)) return;

    if (_controllerCache.length >= MAX_CACHED_CONTROLLERS) {
      _cleanupControllers();
    }

    try {
      final controller =
          await CachedVideoControllerService(DefaultCacheManager())
              .getControllerForVideo(post.videoUrl!);
      _controllerCache[index] = controller;

      await controller.initialize();
      controller.setLooping(true);

      notifyListeners();
    } catch (e) {
      print('Error initializing controller for index $index: $e');
      _controllerCache.remove(index);
    }
  }

  void _cleanupControllers() {
    final keysToRemove = _controllerCache.keys
        .where((key) => (key - _currentIndex).abs() > 1)
        .toList()
      ..sort((a, b) => (a - _currentIndex).abs() - (b - _currentIndex).abs());

    if (keysToRemove.isNotEmpty) {
      _disposeController(keysToRemove.first);
    }
  }

  Future<void> _disposeController(int index) async {
    final controller = _controllerCache[index];
    if (controller != null) {
      await controller.dispose();
      _controllerCache.remove(index);
    }
  }

  void _preloadNextVideos(int currentIndex) {
    _preloadQueue.clear();

    for (int offset = 1; offset < PRELOAD_COUNT / 2; offset++) {
      if (currentIndex + offset < _feed.length) {
        _preloadQueue.add(currentIndex + offset);
      }
      if (currentIndex - offset >= 0) {
        _preloadQueue.add(currentIndex - offset);
      }
    }

    _processPreloadQueue();
  }

  Future<void> _processPreloadQueue() async {
    while (_preloadQueue.isNotEmpty) {
      final index = _preloadQueue.removeFirst();
      await _initializeController(index);
    }
  }

  void onVideoChanged(int index) {
    if (index == _currentIndex) return;

    if (index >= _feed.length - FETCH_THRESHOLD) {
      loadMoreVideos();
    }

    // Only pause/play if it's a video post
    if (_feed[_currentIndex] is VideoFeedPost) {
      _controllerCache[_currentIndex]?.pause();
    }

    _currentIndex = index;

    if (_feed[_currentIndex] is VideoFeedPost) {
      _controllerCache[_currentIndex]?.play();
    }

    _preloadNextVideos(_currentIndex);

    notifyListeners();
  }

  void togglePlayPause(int index) {
    final controller = _controllerCache[index];
    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
      notifyListeners();
    }
  }

  void handleVisibilityChanged(int index, double visibilityFraction) {
    final controller = _controllerCache[index];
    if (controller != null) {
      if (visibilityFraction > 0.8) {
        controller.play();
      } else {
        controller.pause();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllerCache.values) {
      controller.dispose();
    }
    _controllerCache.clear();
    super.dispose();
  }
}
