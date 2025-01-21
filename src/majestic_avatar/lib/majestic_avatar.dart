library majestic_avatar;

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Color _generateRandomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
}

/*
RULES:

[src] can be
1. NULL - If it is null, then show background text with random color.
2. Empty - If it is empty, then show background text with random color.
3. Network URL - Fetch data from network image.
4. Asset image - Fetch data using Image.asset.

[isRound vs radius]
1. isRound and radius, either of those two params are required, not both.

[placeholder]

*/
class MajesticAvatar extends StatefulWidget {
  final String? src;
  final double radius;
  final String? text;
  final TextStyle? textStyle;
  final Color? background;
  final double? height;
  final double? width;
  final BoxFit fit;
  final bool isRound;
  final bool useOldImageOnUrlChange;

  const MajesticAvatar(
    this.src, {
    super.key,
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.useOldImageOnUrlChange = false,
    this.text,
    this.textStyle,
    this.background,
  });

  @override
  State<MajesticAvatar> createState() => _CachedImageState();
}

class _CachedImageState extends State<MajesticAvatar> {
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = widget.background ?? _generateRandomColor();
  }

  Widget _baseBackground(String? text) {
    return Container(
      decoration: BoxDecoration(
        shape: widget.isRound ? BoxShape.circle : BoxShape.rectangle,
        color: _color,
      ),
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      child: text != null
          ? LayoutBuilder(
              builder: (context, constraints) {
                double fontSize =
                    min(constraints.maxWidth, constraints.maxHeight) * 0.5;
                return Text(
                  text[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: _color!.computeLuminance() > .5
                        ? Colors.black
                        : Colors.white,
                  ),
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _getChild() {
    if (widget.src == null) {
      return _baseBackground(widget.text);
    }
    return CachedNetworkImage(
      imageUrl: widget.src!,
      fit: widget.fit,
      useOldImageOnUrlChange: widget.useOldImageOnUrlChange,
      placeholder: (context, url) => _baseBackground(widget.text),
      errorWidget: (context, url, error) {
        print(error);
        return Container(
          height: widget.height,
          width: widget.width,
          color: Colors.black,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ClipRRect(
        borderRadius: widget.isRound
            ? BorderRadius.circular(300)
            : BorderRadius.circular(widget.radius),
        child: _getChild(),
      ),
    );
  }
}
