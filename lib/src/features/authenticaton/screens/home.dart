import 'package:autease/src/constants/text_str.dart';
import 'package:autease/src/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen_temp extends ConsumerWidget {
  const HomeScreen_temp({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(welcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                Text(welcomeSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              AuthRepo.instance.logout();
                            },
                            child: Text("LOGOUT")))
                  ],
                )
              ],
            )));
  }
}

// SizedBox(
//                                   //LOGIN BUTTON
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                       onPressed: () {
//                                         AuthRepo.instance.logout();
//                                       },
//                                       child: const Text("LOGOUT"))),
//                               const SizedBox(height: 10),


