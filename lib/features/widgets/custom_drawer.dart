import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';
import 'package:sw_planner/features/auth/login/cubit/login_cubit.dart';
import 'package:sw_planner/features/calendar_page/pages/calendar_page.dart';
import 'package:sw_planner/features/notes_page/pages/notes.dart';
import 'package:sw_planner/features/tasks_page/pages/tasks.dart';
import 'package:sw_planner/features/user_profile/pages/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomDrawerBody(
        // Profile details
        userName: 'Andrzej',
        userEmail: 'andrzej.grabowski@sw.gov.pl',
        userAvatarUrl:
            'https://cdn.galleries.smcloud.net/t/galleries/gf-HHdG-8NLP-4Av5_nie-uwierzycie-co-andrzej-grabowski-wystawil-na-licytacje-wosp-994x828.jpg',
        userProfileNavLink: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserProfilePage(),
            ),
          );
        },
        firstNavIcon: const Icon(Icons.task_alt),
        firstNavTitle: 'Zadania',
        firstNavLink: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const TasksPage(),
            ),
          );
        },
        secondNavIcon: const Icon(Icons.notes_outlined),
        secondNavTitle: 'Notatki',
        secondNavLink: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NotesPage(),
            ),
          );
        },
        thirdNavIcon: const Icon(Icons.calendar_month),
        thirdNavTitle: 'Kalendarz',
        thirdNavLink: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CalendarPage(),
            ),
          );
        },
        settingsNavIcon: const Icon(Icons.settings),
        settingsNavTitle: 'Ustawienia',
        settingsNavLink: () {},
        logoutNavIcon: const Icon(
          Icons.logout,
          color: Colors.red,
        ),
        logoutNavTitle: 'Wyloguj',
        logoutNavLink:
            () {}, //signOut implemented directly in CustomDrawerBody class
      ),
    );
  }
}

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
    required this.userProfileNavLink,
    required this.firstNavIcon,
    required this.firstNavTitle,
    required this.firstNavLink,
    required this.secondNavIcon,
    required this.secondNavTitle,
    required this.secondNavLink,
    required this.thirdNavIcon,
    required this.thirdNavTitle,
    required this.thirdNavLink,
    required this.settingsNavIcon,
    required this.settingsNavTitle,
    required this.settingsNavLink,
    required this.logoutNavIcon,
    required this.logoutNavTitle,
    required this.logoutNavLink,
    super.key,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;
  final Function() userProfileNavLink;
  final Icon firstNavIcon;
  final String firstNavTitle;
  final Function() firstNavLink;
  final Icon secondNavIcon;
  final String secondNavTitle;
  final Function() secondNavLink;
  final Icon thirdNavIcon;
  final String thirdNavTitle;
  final Function() thirdNavLink;
  final Icon settingsNavIcon;
  final String settingsNavTitle;
  final Function() settingsNavLink;
  final Icon logoutNavIcon;
  final String logoutNavTitle;
  final Function() logoutNavLink;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
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
            onTap: userProfileNavLink,
            child: Column(
              children: [
                userAvatarUrl != ''
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(userAvatarUrl),
                      )
                    : const CircleAvatar(
                        radius: 60,
                        child: FlutterLogo(
                          size: 70,
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
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        ListTile(
            leading: firstNavIcon,
            title: Text(
              firstNavTitle,
              style: GoogleFonts.lato(fontSize: 16),
            ),
            onTap: firstNavLink),
        ListTile(
            leading: secondNavIcon,
            title: Text(
              secondNavTitle,
              style: GoogleFonts.lato(fontSize: 16),
            ),
            onTap: secondNavLink),
        ListTile(
          leading: thirdNavIcon,
          title: Text(
            thirdNavTitle,
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: thirdNavLink,
        ),
        const Divider(),
        ListTile(
          leading: settingsNavIcon,
          title: Text(
            settingsNavTitle,
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: settingsNavLink,
        ),
        const Divider(),
        BlocProvider(
          create: (context) => LoginCubit(AuthRepository()),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ListTile(
                leading: logoutNavIcon,
                title: Text(
                  logoutNavTitle,
                  style: GoogleFonts.lato(fontSize: 16),
                ),
                onTap: () {
                  try {
                    context.read<LoginCubit>().signOut();
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 4),
                        backgroundColor: Colors.red,
                        content: Text('$error'),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
