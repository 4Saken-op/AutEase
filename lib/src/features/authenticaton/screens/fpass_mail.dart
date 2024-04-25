import 'package:autease/src/constants/images_str.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FpassMailScreen extends StatefulWidget {
  FpassMailScreen({super.key});

  @override
  State<FpassMailScreen> createState() => _FpassMailScreenState();
}

class _FpassMailScreenState extends State<FpassMailScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Password reset link sent! Check your Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                e.code.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              SizedBox(height: 30 * 4),
              Column(
                  //SECTION 1
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(fpass), height: size.height * 0.25),
                    SizedBox(height: 30),
                    Text("Forgot Password?",
                        style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(height: 10),
                    Text(
                        "Provide the registered Email to reset your password..",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium),
                  ]),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //DETAILS
                        TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text("E-mail"),
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            )),
                        const SizedBox(height: 10),

                        SizedBox(
                            //LOGIN BUTTON
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: passwordReset,
                                child: const Text("Next"))),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ))
            ])),
      )),
    );
  }
}
