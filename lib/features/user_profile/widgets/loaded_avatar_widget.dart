import 'package:flutter/material.dart';
import 'package:sw_planner/features/user_profile/widgets/camera_simple_dialog.dart';

class LoadedAvatarWidget extends StatelessWidget {
  const LoadedAvatarWidget({
    super.key,
    required this.userAvatarUrl,
    required this.openCamera,
    required this.openGallery,
  });

  final String userAvatarUrl;
  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(userAvatarUrl),
        ),
        InkWell(
          onTap: () {
            avatarSourceDialog(
              context,
              openCamera,
              openGallery,
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.85),
            child: const Icon(
              Icons.add_a_photo,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
