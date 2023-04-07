import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/settings_page/cubit/settings_cubit.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  String newPassword = '';
  String confirmNewPassword = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(UserRepository()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ExpansionTile(
            leading: const Icon(Icons.key),
            title: Text(
              'Zmień hasło',
              style: GoogleFonts.lato(),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 15,
                  right: 15,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;
                    });
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    label: Text(
                      'Ustaw nowe hasło',
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 15,
                  right: 15,
                ),
                child: TextField(
                  onChanged: (newValue) {
                    setState(() {
                      confirmNewPassword = newValue;
                    });
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    label: Text(
                      'Powtórz nowe hasło',
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: newPassword == confirmNewPassword &&
                                newPassword != '' &&
                                newPassword.length >= 8
                            ? () {
                                try {
                                  context.read<SettingsCubit>().updatePassword(
                                        password: newPassword,
                                      );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 4),
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        'Hasło zostało pomyślnie zmienione'),
                                  ));
                                  //print(state.errorMessage);
                                } catch (error) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    duration: const Duration(seconds: 4),
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        'Wystąpił bład: ${state.errorMessage}'),
                                  ));
                                }
                              }
                            : null,
                        child: const Text('Aktualizuj'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
