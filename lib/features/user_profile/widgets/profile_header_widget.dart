import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/user_profile/widgets/loaded_avatar_widget.dart';
import 'package:sw_planner/features/user_profile/widgets/unloaded_avatar_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
    required this.openCamera,
    required this.openGallery,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;
  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 13, 71, 161),
            Color.fromARGB(255, 84, 152, 255)
          ],
        ),
      ),
      child: Column(
        children: [
          if (userAvatarUrl != '')
            LoadedAvatarWidget(
              userAvatarUrl: userAvatarUrl,
              openCamera: openCamera,
              openGallery: openGallery,
            )
          else
            UnloadedAvatarWidget(
              openCamera: openCamera,
              openGallery: openGallery,
            ),
          Visibility(
            visible: userName == '' ? false : true,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                userName,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              userEmail,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
