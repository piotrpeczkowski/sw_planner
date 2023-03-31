import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';
import 'package:sw_planner/features/auth/login/cubit/login_cubit.dart';
import 'package:sw_planner/features/calendar_page/pages/calendar_page.dart';
import 'package:sw_planner/features/notes_page/pages/notes.dart';
import 'package:sw_planner/features/tasks_page/pages/tasks.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';
import 'package:sw_planner/features/user_profile/pages/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final userModel = state.userModel;
        if (userModel == null) {
          return const Drawer(
            child: CustomDrawerBody(
              userName: '',
              userEmail: '',
              userAvatarUrl: '',
            ),
          );
        }
        switch (state.status) {
          case Status.initial:
            return const Drawer(
              child: CustomDrawerBody(
                userName: '',
                userEmail: 'Wczytywanie...',
                userAvatarUrl: '',
              ),
            );
          case Status.loading:
            return Drawer(
              child: CustomDrawerBody(
                userName: '',
                userEmail: 'Wczytywanie...',
                userAvatarUrl: userModel.userAvatarUrl,
              ),
            );
          case Status.success:
            return Drawer(
              child: CustomDrawerBody(
                userName: userModel.userName,
                userEmail: userModel.userEmail,
                userAvatarUrl: userModel.userAvatarUrl,
              ),
            );
          case Status.error:
            return const Drawer(
              child: CustomDrawerBody(
                userName: '',
                userEmail: 'Wystąpił błąd',
                userAvatarUrl: '',
              ),
            );
        }
      },
    );
  }
}

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
    super.key,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;

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
          leading: const Icon(Icons.task_alt),
          title: Text(
            'Zadania',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TasksPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.notes_outlined),
          title: Text(
            'Notatki',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NotesPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: Text(
            'Kalendarz',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CalendarPage(),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(
            'Ustawienia',
            style: GoogleFonts.lato(fontSize: 16),
          ),
          onTap: () {},
        ),
        const Divider(),
        BlocProvider(
          create: (context) => LoginCubit(AuthRepository()),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Wyloguj',
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
