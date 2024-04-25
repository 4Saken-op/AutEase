import 'package:autease/src/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(
      String email, String password, String phoneNo, String fullName) {
    AuthRepo.instance
        .createUserWithEmailAndPassword(email, password, phoneNo, fullName);
  }
}
