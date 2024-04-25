import 'package:autease/src/features/authenticaton/screens/loader.dart';
import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/constants/constants.dart';
import 'package:autease/src/features/social/constants/extensions.dart';
import 'package:autease/src/features/social/providers/profile_page/get_user_info_stream_id.dart';
import 'package:autease/src/features/social/screens/chat_screen.dart';
import 'package:autease/src/features/social/screens/errors.dart';
import 'package:autease/src/features/social/widgets/friends/add_friend_button.dart';
import 'package:autease/src/features/social/widgets/posts/icon_text_button.dart';
import 'package:autease/src/features/social/widgets/profile_page/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    this.userId,
  });

  final String? userId;

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUid = FirebaseAuth.instance.currentUser!.uid;
    final uid = userId ?? myUid;
    final userInfo = ref.watch(getUserInfoAsStreamByIdProvider(uid));

    return userInfo.when(
      data: (user) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
            ),
            backgroundColor: AppColors.whiteColor,
            body: Padding(
              padding: Constants.defaultPadding,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.profilePicUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                    ),
                  ),
                  const SizedBox(height: 20),
                  userId == myUid
                      ? _buildAddToStoryButton()
                      : AddFriendButton(
                          user: user,
                        ),
                  const SizedBox(height: 10),
                  userId == myUid
                      ? const SizedBox(height: 10)
                      : RoundButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              ChatScreen.routeName,
                              arguments: {
                                'userId': userId,
                              },
                            );
                          },
                          label: 'Send Message',
                          color: Colors.transparent,
                        ),
                  const SizedBox(height: 20),
                  _buildProfileInfo(
                    gender: user.gender,
                    birthday: user.birthDay,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }

  _buildAddToStoryButton() =>
      RoundButton(onPressed: () {}, label: 'Add to Story');

  _buildProfileInfo({
    required String gender,
    required DateTime birthday,
  }) =>
      Column(
        children: [
          IconTextButton(
            icon: gender == 'male' ? Icons.male : Icons.female,
            label: gender,
          ),
          const SizedBox(height: 10),
          IconTextButton(
            icon: Icons.cake,
            label: birthday.yMMMEd(),
          ),
          const SizedBox(height: 10),
        ],
      );
}
