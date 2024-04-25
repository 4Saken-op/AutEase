import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/widgets/chat/message.dart';
import 'package:autease/src/features/social/widgets/posts/post_image_video.dart';
import 'package:flutter/material.dart';

class MessageContents extends StatelessWidget {
  const MessageContents({
    super.key,
    required this.message,
    this.isSentMessage = false,
  });

  final Message message;
  final bool isSentMessage;

  @override
  Widget build(BuildContext context) {
    if (message.messageType == 'text') {
      return Text(
        message.message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isSentMessage ? AppColors.whiteColor : AppColors.blackColor,
        ),
      );
    } else {
      return PostImageVideoView(
        fileUrl: message.message,
        fileType: message.messageType,
      );
    }
  }
}
