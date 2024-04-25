import 'package:autease/src/features/social/widgets/posts/comments_list.dart';
import 'package:autease/src/features/social/widgets/posts/comments_textfield.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  final String postId;

  static const routeName = '/comments';

  // hello world

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          // Comments List
          CommentsList(postId: postId),

          // Comment Text field
          CommentTextField(
            postId: postId,
          ),
        ],
      ),
    );
  }
}
