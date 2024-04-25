import 'package:autease/src/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void loginUser(String email, String password) {
    AuthRepo.instance.loginUserWithEmailAndPassword(email, password);
  }
}
