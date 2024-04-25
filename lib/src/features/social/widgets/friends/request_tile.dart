import 'package:autease/src/features/authenticaton/screens/loader.dart';
import 'package:autease/src/features/social/providers/posts/friend_provider.dart';
import 'package:autease/src/features/social/providers/profile_page/get_user_info_stream_id.dart';
import 'package:autease/src/features/social/screens/errors.dart';
import 'package:autease/src/features/social/screens/profile_screen.dart';
import 'package:autease/src/features/social/widgets/profile_page/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestTile extends ConsumerWidget {
  const RequestTile({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(getUserInfoAsStreamByIdProvider(userId));
    return userData.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProfileScreen.routeName,
                      arguments: user.uid,
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.profilePicUrl),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: RoundButton(
                            onPressed: () {
                              ref
                                  .read(friendProvider)
                                  .acceptFriendRequest(userId: userId);
                            },
                            label: 'Accept',
                            height: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RoundButton(
                            onPressed: () {
                              ref
                                  .read(friendProvider)
                                  .removeFriendRequest(userId: userId);
                            },
                            label: 'Reject',
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
