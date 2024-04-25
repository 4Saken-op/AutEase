import 'package:autease/src/features/social/widgets/posts/network_video.dart';
import 'package:flutter/material.dart';

class PostImageVideoView extends StatelessWidget {
  const PostImageVideoView({
    Key? key,
    required this.fileType,
    required this.fileUrl,
  }) : super(key: key);

  final String fileType;
  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    if (fileType == 'image') {
      return Image.network(fileUrl);
    } else {
      return NetworkVideoView(
        videoUrl: fileUrl,
      );
    }
  }
}
