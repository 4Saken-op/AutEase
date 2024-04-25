import 'package:autease/src/repository/friends_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendProvider = Provider((ref) {
  return FriendRepository();
});
