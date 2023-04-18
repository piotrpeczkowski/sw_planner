import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';
import 'package:sw_planner/features/auth/login/cubit/login_cubit.dart';
import 'package:sw_planner/features/auth/widgets/app_version_widget.dart';
import 'package:sw_planner/features/auth/widgets/confirm_password_message_widget.dart';
import 'package:sw_planner/features/auth/widgets/confirm_password_widget.dart';
import 'package:sw_planner/features/auth/widgets/email_message_widget.dart';
import 'package:sw_planner/features/auth/widgets/email_widget.dart';
import 'package:sw_planner/features/auth/widgets/login_button_widget.dart';
import 'package:sw_planner/features/auth/widgets/login_header_widget.dart';
import 'package:sw_planner/features/auth/widgets/password_message_widget.dart';
import 'package:sw_planner/features/auth/widgets/password_widget.dart';
import 'package:sw_planner/features/auth/widgets/remind_password_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepository()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 4),
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return LoginPageBody(
              appVersion: 'SW Planner\u00A9 2023 | v.1.0.1',
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              isCreatingAccount: state.isCreatingAccount,
              emailMessage: state.domainVerificationMessage,
              passwordMessage: state.passwordVerificationMessage,
              confirmPasswordMessage: state.passwordConfirmationMessage,
              onLoginAndRegisterSwitch: () {
                if (state.isCreatingAccount) {
                  context.read<LoginCubit>().switchToLogging();
                  emailController.clear();
                  passwordController.clear();
                  confirmPasswordController.clear();
                } else {
                  context.read<LoginCubit>().switchToRegistration();
                  emailController.clear();
                  passwordController.clear();
                  confirmPasswordController.clear();
                }
              },
              onLoginButtonTap: () {
                if (state.isCreatingAccount) {
                  context.read<LoginCubit>().registration(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim(),
                      );
                } else {
                  context.read<LoginCubit>().logging(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

//TODO: Add email confirmation while registering

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
    required this.appVersion,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isCreatingAccount,
    required this.onLoginAndRegisterSwitch,
    required this.onLoginButtonTap,
    required this.emailMessage,
    required this.passwordMessage,
    required this.confirmPasswordMessage,
  });

  final String appVersion;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isCreatingAccount;
  final void Function() onLoginAndRegisterSwitch;
  final void Function() onLoginButtonTap;
  final String emailMessage;
  final String passwordMessage;
  final String confirmPasswordMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 84, 152, 255),
              Color.fromARGB(255, 13, 71, 161),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AppVersionWidget(appVersion: appVersion),
            ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.18,
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: 15,
                right: 15,
              ),
              children: [
                LoginHeaderWidget(
                  isCreatingAccount: isCreatingAccount,
                  onLoginAndRegisterSwitch: onLoginAndRegisterSwitch,
                ),
                EmailWidget(
                  emailController: emailController,
                  isCreatingAccount: isCreatingAccount,
                ),
                EmailMessageWidget(
                  emailMessage: emailMessage,
                ),
                PasswordWidget(
                  passwordController: passwordController,
                  isCreatingAccount: isCreatingAccount,
                ),
                PasswordMessageWidget(
                  passwordMessage: passwordMessage,
                ),
                ConfirmPasswordWidget(
                  isCreatingAccount: isCreatingAccount,
                  confirmPasswordController: confirmPasswordController,
                ),
                ConfirmPasswordMessageWidget(
                  isCreatingAccount: isCreatingAccount,
                  confirmPasswordMessage: confirmPasswordMessage,
                ),
                RemindPasswordWidget(
                  isCreatingAccount: isCreatingAccount,
                ),
                LoginButtonWidget(
                  onLoginButtonTap: onLoginButtonTap,
                  isCreatingAccount: isCreatingAccount,
                ),
                Text(
                  isCreatingAccount
                      ? '* Rejestrując się akceptujesz warunki korzystania.'
                      : '* Logując się akceptujesz warunki korzystania.',
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
