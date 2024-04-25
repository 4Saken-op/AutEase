import 'package:autease/src/repository/posts_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsProvider = Provider((ref) {
  return PostRepository();
});
