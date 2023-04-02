import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/auth/login/cubit/login_cubit.dart';
import 'package:sw_planner/features/custom_drawer/widgets/calendar_widget.dart';
import 'package:sw_planner/features/custom_drawer/widgets/drawer_header_widget.dart';
import 'package:sw_planner/features/custom_drawer/widgets/flag_separator_widget.dart';
import 'package:sw_planner/features/custom_drawer/widgets/notes_widget.dart';
import 'package:sw_planner/features/custom_drawer/widgets/settings_widget.dart';
import 'package:sw_planner/features/custom_drawer/widgets/tasks_widget.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(UserRepository())..start(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
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
      ),
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
        HeaderWidget(
          userAvatarUrl: userAvatarUrl,
          userName: userName,
          userEmail: userEmail,
        ),
        const FlagSeparatorWidget(),
        const TasksWidget(),
        const NotesWidget(),
        const CalendarWidget(),
        const Divider(),
        const SettingsWidget(),
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
