import 'dart:async';

import 'package:autease/src/features/social/constants/firebase_collections.dart';
import 'package:autease/src/features/social/constants/firebase_field_names.dart';
import 'package:autease/src/features/social/widgets/chat/chatroom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllChatsProvider =
    StreamProvider.autoDispose<Iterable<Chatroom>>((ref) {
  final myUid = FirebaseAuth.instance.currentUser!.uid;

  final controller = StreamController<Iterable<Chatroom>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.chatrooms)
      .where(FirebaseFieldNames.members, arrayContains: myUid)
      .orderBy(FirebaseFieldNames.lastMessageTs)
      .snapshots()
      .listen((snapshot) {
    final chats = snapshot.docs.map(
      (chatData) => Chatroom.fromMap(
        chatData.data(),
      ),
    );
    controller.sink.add(chats);
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
