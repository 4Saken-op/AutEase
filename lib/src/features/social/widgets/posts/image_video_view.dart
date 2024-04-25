import 'dart:io';

import 'package:autease/src/features/social/widgets/posts/video_view.dart';
import 'package:flutter/material.dart';

class ImageVideoView extends StatelessWidget {
  const ImageVideoView({
    Key? key,
    required this.fileType,
    required this.file,
  }) : super(key: key);

  final String fileType;
  final File file;

  @override
  Widget build(BuildContext context) {
    if (fileType == 'image') {
      return Image.file(file);
    } else {
      return VideoView(
        video: file,
      );
    }
  }
}
