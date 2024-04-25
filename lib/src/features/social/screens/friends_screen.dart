import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/constants/constants.dart';
import 'package:autease/src/features/social/widgets/friends/friends_list.dart';
import 'package:autease/src/features/social/widgets/friends/request_list.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: Constants.defaultPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                'Requests',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            RequestsList(),
            SliverToBoxAdapter(
              child: Divider(
                height: 50,
                thickness: 3,
                color: Colors.black,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Friends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            FriendsList(),
          ],
        ),
      ),
    );
  }
}
