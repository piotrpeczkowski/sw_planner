import 'package:flutter/material.dart';
import 'package:sw_planner/features/user_profile/widgets/camera_simple_dialog.dart';

class UnloadedAvatarWidget extends StatelessWidget {
  const UnloadedAvatarWidget({
    super.key,
    required this.openCamera,
    required this.openGallery,
  });

  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        const ClipOval(
          child: CircleAvatar(
            radius: 60,
            child: Opacity(
              opacity: 0.6,
              child: Image(
                height: 110,
                image: AssetImage('images/def_avatar.png'),
              ),
            ),
          ),
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
