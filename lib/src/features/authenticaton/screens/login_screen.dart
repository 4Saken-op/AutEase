import 'package:autease/src/constants/images_str.dart';
import 'package:autease/src/constants/text_str.dart';
import 'package:autease/src/features/authenticaton/controllers/login_controller.dart';
import 'package:autease/src/features/authenticaton/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fpass_mail.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              //SECTION 1
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(welcomeImage),
                    height: size.height * 0.25),
                Text(loginTitle,
                    style: Theme.of(context).textTheme.headlineLarge),
                Text(loginSubTitle,
                    style: Theme.of(context).textTheme.titleMedium),

                //SECTION 2
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      TextField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        // Changed to use the LoginController for password
                        controller: controller.password,
                        obscureText: true, // Password is hidden
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        //FORGOT PASSWORD
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              //--POP UP BOX FOR FORGET PASSWORD
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //--TOP TITLE
                                          Text("Make Selection!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          Text(
                                              "Select one of the options given below to reset your password",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge),
                                          const SizedBox(height: 30),

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Get.to(() => FpassMailScreen());
                                            },
                                            child: Container(
                                                //--EMAIL BOX
                                                padding:
                                                    const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        Colors.grey.shade200),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                        Icons
                                                            .mail_outline_rounded,
                                                        size: 60),
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("E-mail",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineSmall),
                                                        Text(
                                                            "Reset via Email verification.",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ),

                                          const SizedBox(height: 10),

                                          // GestureDetector(
                                          //   onTap: () {
                                          //     Get.to(() => FpassMailScreen());
                                          //   },
                                          //   child: Container(
                                          //       //--EMAIL BOX
                                          //       padding:
                                          //           const EdgeInsets.all(20),
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           color:
                                          //               Colors.grey.shade200),
                                          //       child: Row(
                                          //         children: [
                                          //           const Icon(
                                          //               Icons
                                          //                   .mobile_friendly_rounded,
                                          //               size: 60),
                                          //           const SizedBox(width: 10),
                                          //           Column(
                                          //             crossAxisAlignment:
                                          //                 CrossAxisAlignment
                                          //                     .start,
                                          //             children: [
                                          //               Text("Phone No",
                                          //                   style: Theme.of(
                                          //                           context)
                                          //                       .textTheme
                                          //                       .headlineSmall),
                                          //               Text(
                                          //                   "Reset via Phone verification.",
                                          //                   style: Theme.of(
                                          //                           context)
                                          //                       .textTheme
                                          //                       .labelSmall),
                                          //             ],
                                          //           )
                                          //         ],
                                          //       )),
                                          // )
                                        ],
                                      )));
                            },
                            child: const Text("Forgot Password?")),
                      ),
                      SizedBox(
                          //LOGIN BUTTON
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                LoginController.instance.loginUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                              },
                              child: Text("Login"))),
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
                          //           image: AssetImage(googleImage), width: 20),
                          //       onPressed: () {},
                          //       label: Text("Sign-In with Google")),
                          // ),
                          const SizedBox(height: 10),
                          Align(
                            //ALREA
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: () =>
                                    Get.to(() => const SignUpScreen()),
                                child: const Text(
                                    "Don't have an Account? SignUp")),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      )),
    );
  }
}
