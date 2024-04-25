import 'dart:async';

import 'package:autease/src/features/social/constants/firebase_collections.dart';
import 'package:autease/src/features/social/constants/firebase_field_names.dart';
import 'package:autease/src/features/social/widgets/profile_page/child_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final getUserInfoAsStreamByIdProvider =
    StreamProvider.autoDispose.family<UserModel, String>((ref, String userId) {
  final controller = StreamController<UserModel>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.details)
      .where(FirebaseFieldNames.uid, isEqualTo: userId)
      .limit(1)
      .snapshots()
      .listen((snapshot) {
    final userData = snapshot.docs.first;
    final user = UserModel.fromMap(userData.data());
    controller.sink.add(user);
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
