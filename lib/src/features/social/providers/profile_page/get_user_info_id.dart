import 'package:autease/src/features/social/constants/firebase_collections.dart';
import 'package:autease/src/features/social/widgets/profile_page/child_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final getUserInfoByIdProvider =
    FutureProvider.autoDispose.family<UserModel, String>((ref, userId) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.details)
      .doc(userId)
      .get()
      .then((userData) {
    return UserModel.fromMap(userData.data()!);
  });
});
