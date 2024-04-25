import 'dart:io';

import 'package:autease/src/features/social/screens/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:autease/src/features/authenticaton/screens/welcome_screen.dart';
import 'package:autease/src/features/social/constants/firebase_collections.dart';
import 'package:autease/src/features/social/constants/storage_folder_names.dart';
import 'package:autease/src/features/social/screens/create_profile_page.dart';
import 'package:autease/src/features/social/utils/utils.dart';
import 'package:autease/src/features/social/widgets/profile_page/child_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String phoneNo, String fullName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .set({
        'name': fullName,
        'email': email,
        'phone': phoneNo,
      });

      getSuccessSnackBar(
          "Successfully logged in as ${firebaseUser.value!.email}");

      firebaseUser.value == null
          ? Get.offAll(() => const WelcomeScreen())
          : Get.offAll(() => const CreateProfileScreen());
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Account Creating Failed", e);
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Login Failed", e);
    }
  }

  Future<void> logout() async => await _auth.signOut();

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  Future<void> createChildProfile({
    required String fullName,
    required DateTime birthday,
    required String gender,
    required File? image,
  }) async {
    try {
      // Save image to firebase storage
      final path = FirebaseStorage.instance
          .ref(StorageFolderNames.profilePics)
          .child(FirebaseAuth.instance.currentUser!.uid);

      if (image == null) {
        print("Image not provided");
        return null;
      }

      final taskSnapshot = await path.putFile(image);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      UserModel user = UserModel(
        fullName: fullName,
        birthDay: birthday,
        gender: gender,
        profilePicUrl: downloadUrl,
        uid: _auth.currentUser!.uid,
        friends: const [],
        sentRequests: const [],
        receivedRequests: const [],
      );

      // save user to firestore
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionNames.details)
          .doc(_auth.currentUser!.uid)
          .set(
            user.toMap(),
          );
    } catch (e) {
      showToastMessage(text: e.toString());
      print("Couldnt add items to database");
    }

    firebaseUser.value == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomeScreen());
  }

  // Verify Email
  Future<String?> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        user.sendEmailVerification();
      }
      return null;
    } catch (e) {
      showToastMessage(text: e.toString());
      return e.toString();
    }
  }

  // get user info
  Future<UserModel> getUserInfo() async {
    final userData = await FirebaseFirestore.instance
        .collection(FirebaseCollectionNames.details)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final user = UserModel.fromMap(userData.data()!);
    return user;
  }
}
