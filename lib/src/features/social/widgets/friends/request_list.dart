import 'package:autease/src/features/authenticaton/screens/loader.dart';
import 'package:autease/src/features/social/providers/posts/get_all_requests.dart';
import 'package:autease/src/features/social/screens/errors.dart';
import 'package:autease/src/features/social/widgets/friends/request_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestsList extends ConsumerStatefulWidget {
  const RequestsList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RequestsListState();
}

class _RequestsListState extends ConsumerState<RequestsList> {
  @override
  Widget build(BuildContext context) {
    final requestList = ref.watch(getAllFriendRequestsProvider);

    return requestList.when(
      data: (requests) {
        return SliverList.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final userId = requests.elementAt(index);
            return RequestTile(
              userId: userId,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: ErrorScreen(error: error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Loader(),
        );
      },
    );
  }
}
