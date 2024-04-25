import 'package:autease/firebase_options.dart';
import 'package:autease/src/features/authenticaton/screens/welcome_screen.dart';
import 'package:autease/src/repository/auth_repo.dart';
import 'package:autease/src/routes/routes.dart';
import 'package:autease/src/themes/new_themes.dart';
import 'package:autease/src/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthRepo()));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      darkTheme: AppTheme1.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}


// Platform  Firebase App Id
// web       1:886570974425:web:ae9621d6f5460251c312c8
// android   1:886570974425:android:15bd0dd46797b80fc312c8

