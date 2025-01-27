import 'dart:math' as math;

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

// local imports
import 'models/user_feed_post.dart';
import 'provider/user_feed_provider.dart';

class UserFeed extends StatefulWidget {
  const UserFeed({super.key});

  @override
  State<UserFeed> createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  @override
  void initState() {
    super.initState();

    // ideally this call should be made at a place where initState is not called often or only called once the app is launched.
    context.read<UserFeedProvider>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserFeedProvider>();

    if (provider.isInitializingFeed) {
      return const Center(
        child: Text("Initializing feed..."),
      );
    }

    return CustomMaterialIndicator(
      backgroundColor: Colors.black,
      onRefresh: provider.refreshFeed,
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircularProgressIndicator(
            color: Colors.white,
            value: controller.state.isLoading
                ? null
                : math.min(controller.value, 1.0),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: provider.feed.isEmpty
            ? const DescriptiveText("Your feed is empty.")
            : PageView.builder(
                controller: provider.feedController,
                scrollDirection: Axis.vertical,
                itemCount: provider.feed.length,
                onPageChanged: provider.onVideoChanged,
                itemBuilder: (context, index) {
                  final post = provider.feed[index];

                  if (post is VideoFeedPost) {
                    return VideoPlayerWidget(
                      controller: provider.getController(index),
                      index: index,
                      videoPost: post,
                    );
                  }
                  // else if (post is AdvertisementFeedPost) {
                  //   return AdvertisementView(adPost: post);
                  // }

                  return const SizedBox.shrink(); // Fallback
                },
              ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  final int index;
  final VideoFeedPost videoPost;

  const VideoPlayerWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.videoPost,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserFeedProvider>();

    if (controller == null || !controller!.value.isInitialized) {
      return const DescriptiveText('Loading...');
    }

    return VisibilityDetector(
      key: Key('video-$index'),
      onVisibilityChanged: (visibilityInfo) {
        provider.handleVisibilityChanged(index, visibilityInfo.visibleFraction);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildVideoPlayer(context),
          // _buildAudioControl(),
          // ..._buildBottomContent(),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<UserFeedProvider>().togglePlayPause(index),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildVideoDisplay(constraints),
              VideoPlayPauseOverlay(controller: controller!),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoDisplay(BoxConstraints constraints) {
    if (controller!.value.aspectRatio < 1) {
      return SizedBox(
        width: controller!.value.size.width,
        height: constraints.maxHeight,
        child: VideoPlayer(controller!),
      );
    }
    return Center(
      child: AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      ),
    );
  }

  // Widget _buildAudioControl() {
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: Padding(
  //       padding: const EdgeInsets.only(right: 15, top: 15),
  //       child: AudioControlButton(videoPlayerController: controller!),
  //     ),
  //   );
  // }

  // List<Widget> _buildBottomContent() {
  //   return [
  //     Align(
  //       alignment: Alignment.bottomLeft,
  //       child: FeedBottomLeftView(
  //         authorId: videoPost.createdBy!,
  //         caption: videoPost.title,
  //       ),
  //     ),
  //     Align(
  //       alignment: Alignment.bottomRight,
  //       child: FeedBottomRightView(
  //         commentCount: videoPost.commentCount,
  //         likeCount: videoPost.likeCount,
  //         postId: videoPost.id,
  //         viewCount: videoPost.views,
  //         authorId: videoPost.createdBy!,
  //       ),
  //     ),
  //   ];
  // }
}

class VideoPlayPauseOverlay extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoPlayPauseOverlay({super.key, required this.controller});

  @override
  State<VideoPlayPauseOverlay> createState() => _VideoPlayPauseOverlayState();
}

class _VideoPlayPauseOverlayState extends State<VideoPlayPauseOverlay> {
  bool showPlayArrow = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (mounted && showPlayArrow != !widget.controller.value.isPlaying) {
        showPlayArrow = !widget.controller.value.isPlaying;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: showPlayArrow ? 1 : 0,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(15),
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// class AdvertisementView extends StatelessWidget {
//   final AdvertisementFeedPost adPost;

//   const AdvertisementView({super.key, required this.adPost});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//         onTap: () => Utils.navigateTo(WebviewContainer(advertisement: adPost)),
//         child: Container(
//           color: Colors.black,
//           child: Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                       adPost.backgroundImage!,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // child: CachedImage(adPost.backgroundImage),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.amber[800],
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 30,
//                           vertical: 10,
//                         ),
//                         child: const Text(
//                           'Sponsored Ad',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.black38,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 22,
//                         vertical: 12,
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'View Official Site ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DescriptiveText extends StatelessWidget {
  final String text;

  const DescriptiveText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
