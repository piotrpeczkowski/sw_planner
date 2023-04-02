
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/user_profile/pages/profile_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.userAvatarUrl,
    required this.userName,
    required this.userEmail,
  });

  final String userAvatarUrl;
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 50,
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
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserProfilePage(),
            ),
          );
        },
        child: Column(
          children: [
            userAvatarUrl != ''
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(userAvatarUrl),
                  )
                : const ClipOval(
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
            Visibility(
              visible: userName == '' ? false : true,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
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
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
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
      ),
    );
  }
}
