import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/widgets/chat/message.dart';
import 'package:autease/src/features/social/widgets/chat/message_contents.dart';
import 'package:autease/src/features/social/widgets/posts/round_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceivedMessage extends ConsumerWidget {
  final Message message;

  const ReceivedMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          RoundProfileTile(url: message.senderId),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: AppColors.messengerGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: MessageContents(message: message),
            ),
          ),
        ],
      ),
    );
  }
}
