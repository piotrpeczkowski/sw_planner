import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sw_planner/features/auth/login/pages/login_page.dart';
import 'package:sw_planner/features/tasks_page/pages/tasks.dart';
import 'package:sw_planner/root/cubit/root_cubit.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return const TasksPage();
        },
      ),
    );
  }
}
