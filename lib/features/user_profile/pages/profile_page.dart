import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return UserProfilePageBody(
      userName: 'Andrzej Grabowski',
      userEmail: 'andrzej.grabowski@sw.gov.pl',
      userAvatarUrl:
          'https://cdn.galleries.smcloud.net/t/galleries/gf-HHdG-8NLP-4Av5_nie-uwierzycie-co-andrzej-grabowski-wystawil-na-licytacje-wosp-994x828.jpg',
      userNameController: _userNameController,
      onSave: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class UserProfilePageBody extends StatelessWidget {
  const UserProfilePageBody({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
    required this.userNameController,
    required this.onSave,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;
  final TextEditingController userNameController;
  final Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil użytkownika', style: GoogleFonts.kanit()),
        actions: [
          IconButton(
            onPressed: onSave,
            tooltip: 'Zapisz',
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
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
                userAvatarUrl != ''
                    ? Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(userAvatarUrl),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.85),
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const CircleAvatar(
                        radius: 60,
                        child: FlutterLogo(
                          size: 70,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    userName,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  userEmail,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            height: 3,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          ListView(
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            children: [
              TextField(
                controller: userNameController,
                maxLines: 1,
                maxLength: 25,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  label: Text(
                    'Nazwa użytkownika',
                    style: GoogleFonts.lato(),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 13, 71, 161),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
