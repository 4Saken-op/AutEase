import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:autease/src/features/social/constants/constants.dart';
import 'package:autease/src/features/social/widgets/chat/chat_list.dart';
import 'package:autease/src/features/social/widgets/chat/profile_pic.dart';
// import 'package:autease/src/features/social/widgets/posts/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const routeName = '/chats-screen';

  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: Constants.defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // build chats app bar
                _buildChatsAppBar(),

                const SizedBox(height: 20),

                // Search widget
                _buildChatsSearchWidget(),

                const SizedBox(height: 30),

                // Chats List
                const SizedBox(
                  height: 600,
                  child: ChatsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatsAppBar() => const Row(
        children: [
          MyProfilePic(),
          SizedBox(width: 10),
          SizedBox(height: 50),
          Text(
            'Chats',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),
          // RoundIconButton(
          //   icon: FontAwesomeIcons.camera,
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(CreateStoryScreen.routeName);
          //   },
          // )
        ],
      );

  Widget _buildChatsSearchWidget() => Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Icon(Icons.search),
            SizedBox(width: 15),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      );
}
