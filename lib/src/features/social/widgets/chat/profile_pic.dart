import 'package:autease/src/features/authenticaton/screens/loader.dart';
import 'package:autease/src/features/social/providers/profile_page/get_user_info.dart';
import 'package:autease/src/features/social/screens/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfilePic extends ConsumerWidget {
  const MyProfilePic({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoProvider);

    return userInfo.when(
      data: (user) {
        return CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            user.profilePicUrl,
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
}
