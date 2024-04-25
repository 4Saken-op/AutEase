import 'dart:io';

import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/constants/constants.dart';
import 'package:autease/src/features/social/utils/utils.dart';
import 'package:autease/src/features/social/utils/validators.dart';
import 'package:autease/src/features/social/widgets/profile_page/birthday_picker.dart';
import 'package:autease/src/features/social/widgets/profile_page/gender_picker.dart';
import 'package:autease/src/features/social/widgets/profile_page/pick_image_widget.dart';
import 'package:autease/src/features/social/widgets/profile_page/round_button.dart';
import 'package:autease/src/features/social/widgets/profile_page/round_text_field.dart';
import 'package:autease/src/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class CreateProfileScreen extends ConsumerStatefulWidget {
  const CreateProfileScreen({super.key});

  static const routeName = '/create-profile';

  @override
  ConsumerState<CreateProfileScreen> createState() =>
      _CreateProfileScreenState();
}

class _CreateProfileScreenState extends ConsumerState<CreateProfileScreen> {
  File? image;
  DateTime? birthday;
  String gender = 'male';
  bool isLoading = false;

  // controllers
  late final TextEditingController _fNameController;
  late final TextEditingController _lNameController;
  // late final TextEditingController _emailController;
  // late final TextEditingController _passwordController;

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    // _emailController = TextEditingController();
    // _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    // _emailController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  Future<void> createProfile() async {
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   setState(() => isLoading = true);
    //   await ref
    //       .read(authProvider)
    //       .createAccount(
    //         fullName: '${_fNameController.text} ${_lNameController.text}',
    //         birthday: birthday ?? DateTime.now(),
    //         gender: gender,
    //         // email: _emailController.text,
    //         // password: _passwordController.text,
    //         image: image,
    // //       )
    //       .then((credential) {
    //     if (!credential!.user!.emailVerified) {
    //       Navigator.pop(context);
    //     }
    //   }).catchError((_) {
    //     setState(() => isLoading = false);
    //   });
    //   setState(() => isLoading = false);
    // }

    // try {
    //   await FirebaseFirestore.instance
    //       .collection('Users')
    //       .doc(_auth.currentUser!.uid)
    //       .set({
    //     'name': fullName,
    //     'email': email,
    //     'phone': phoneNo,
    //   });

    //   getSuccessSnackBar(
    //       "Successfully logged in as ${firebaseUser.value!.email}");

    //   firebaseUser.value == null
    //       ? Get.offAll(() => const WelcomeScreen())
    //       : Get.offAll(() => const CreateAccountScreen());
    // } on FirebaseAuthException catch (e) {
    //   //define error
    //   getErrorSnackBar("Account Creating Failed", e);
    // }

    AuthRepo.instance.createChildProfile(
      fullName: '${_fNameController.text} ${_lNameController.text}',
      birthday: birthday ?? DateTime.now(),
      gender: gender,
      // email: _emailController.text,
      // password: _passwordController.text,
      image: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    image = await pickImage();
                    setState(() {});
                  },
                  child: PickImageWidget(image: image),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // First Name Text Field
                    Expanded(
                      child: RoundTextField(
                        controller: _fNameController,
                        hintText: 'First name',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Last Name Text Field
                    Expanded(
                      child: RoundTextField(
                        controller: _lNameController,
                        hintText: 'Last name',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BirthdayPicker(
                  dateTime: birthday ?? DateTime.now(),
                  onPressed: () async {
                    birthday = await pickSimpleDate(
                      context: context,
                      date: birthday,
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                GenderPicker(
                  gender: gender,
                  onChanged: (value) {
                    gender = value ?? 'male';
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                // Phone number / email text field
                // RoundTextField(
                //   controller: _fNameController,
                //   hintText: 'First name',
                //   textInputAction: TextInputAction.next,
                //   validator: validateName,
                // ),
                // const SizedBox(height: 20),
                // // Password Text Field
                // RoundTextField(
                //   controller: _fNameController,
                //   hintText: 'First name',
                //   textInputAction: TextInputAction.next,
                //   validator: validateName,
                // ),
                // const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : RoundButton(
                        onPressed: createProfile,
                        label: 'Create Child\'s Profile',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
