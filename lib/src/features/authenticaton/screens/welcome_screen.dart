import 'package:autease/src/constants/images_str.dart';
import 'package:autease/src/constants/text_str.dart';
import 'package:autease/src/features/authenticaton/screens/login_screen.dart';
import 'package:autease/src/features/authenticaton/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage(welcomeImage)),
                Text(welcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                Text(welcomeSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () => Get.to(() => LoginScreen()),
                            child: Text(login))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => SignUpScreen()),
                            child: Text(signup)))
                  ],
                )
              ],
            )));
  }
}
