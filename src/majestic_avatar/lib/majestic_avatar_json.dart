import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majestic_avatar/utils/utils.dart';

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
    _color = widget.background ?? Utils.generateRandomColor();
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
