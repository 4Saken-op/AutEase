import 'package:autease/src/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((ref) {
  return AuthRepo();
});
