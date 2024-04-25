import 'package:autease/src/constants/images_str.dart';
import 'package:autease/src/constants/text_str.dart';
import 'package:autease/src/features/authenticaton/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SECTTON1
                    Image(
                        image: AssetImage(welcomeImage),
                        height: size.height * 0.25),
                    SizedBox(height: 10),
                    Text(signUpTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center),
                    Text(signUpSubTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center),

                    //SECTION2
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //DETAILS
                          TextField(
                              controller: controller.fullName,
                              decoration: const InputDecoration(
                                label: Text("Full Name"),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                                border: OutlineInputBorder(),
                              )),
                          const SizedBox(height: 10),
                          TextField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(),
                              )),
                          const SizedBox(height: 10),
                          TextField(
                              controller: controller.phoneNo,
                              decoration: const InputDecoration(
                                label: Text("Phone No"),
                                prefixIcon: Icon(Icons.phone_android_outlined),
                                border: OutlineInputBorder(),
                              )),
                          const SizedBox(height: 10),
                          TextField(
                              controller: controller.password,
                              decoration: const InputDecoration(
                                label: Text("Create Password"),
                                prefixIcon: Icon(Icons.lock_clock_outlined),
                                border: OutlineInputBorder(),
                              )),
                          const SizedBox(height: 20),

                          SizedBox(
                              //LOGIN BUTTON
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    SignUpController.instance.registerUser(
                                        controller.email.text.trim(),
                                        controller.password.text.trim(),
                                        controller.phoneNo.text.trim(),
                                        controller.fullName.text.trim());
                                  },
                                  child: const Text("Register"))),
                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // const Text("OR"),
                              // const SizedBox(height: 10),
                              // SizedBox(
                              //   width: double.infinity,
                              //   child: OutlinedButton.icon(
                              //       icon: const Image(
                              //           image: AssetImage(googleImage),
                              //           width: 20),
                              //       onPressed: () {},
                              //       label: const Text("Sign-Up with Google")),
                              // ),
                              const SizedBox(height: 10),
                              Align(
                                //ALREA
                                alignment: Alignment.center,
                                child: TextButton(
                                    onPressed: () =>
                                        Get.to(() => const LoginScreen()),
                                    child:
                                        const Text("Already have an Account?")),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
