import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';
import 'package:sw_planner/features/auth/login/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isCreatingAccount = false;
  bool _isDomainCorrect = false;
  bool _isPasswordCorrect = false;
  bool _isPasswordConfirmed = false;
  String _loginMessage = '';
  String _passwordMessage = '';
  String _confirmPasswordMessage = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepository()),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return LoginPageBody(
            appFooter: 'SW Planner\u00A9 2023 | v.1.0.1',
            loginController: widget.loginController,
            passwordController: widget.passwordController,
            confirmPasswordController: widget.confirmPasswordController,
            isCreatingAccount: _isCreatingAccount,
            loginMessage: _loginMessage,
            passwordMessage: _passwordMessage,
            confirmPasswordMessage: _confirmPasswordMessage,
            onLoginAndRegisterSwitch: () {
              if (_isCreatingAccount) {
                setState(() {
                  _isCreatingAccount = false;
                  widget.loginController.clear();
                  _loginMessage = '';
                  widget.passwordController.clear();
                  _passwordMessage = '';
                  widget.confirmPasswordController.clear();
                  _confirmPasswordMessage = '';
                });
              } else {
                setState(() {
                  _isCreatingAccount = true;
                  widget.loginController.clear();
                  _loginMessage = '';
                  widget.passwordController.clear();
                  _passwordMessage = '';
                  widget.confirmPasswordController.clear();
                  _confirmPasswordMessage = '';
                });
              }
            },
            onLoginButtonTap: () {
              if (widget.loginController.text.contains('@sw.gov.pl')) {
                setState(() {
                  _loginMessage = '';
                  _isDomainCorrect = true;
                });
              } else if (widget.loginController.text.isEmpty) {
                setState(() {
                  _loginMessage = 'Wprowadź adres email';
                  _isDomainCorrect = false;
                });
              } else {
                setState(() {
                  _loginMessage = 'Domena @sw.gov.pl jest wymagana';
                  _isDomainCorrect = false;
                });
              }

              if (widget.passwordController.text.isNotEmpty) {
                if (widget.passwordController.text.length < 8) {
                  setState(() {
                    _passwordMessage =
                        'Hasło musi zawierać conajmniej 8 znaków';
                    _isPasswordCorrect = false;
                  });
                } else {
                  setState(() {
                    _passwordMessage = '';
                    _isPasswordCorrect = true;
                  });
                }
              } else {
                setState(() {
                  _passwordMessage = 'Wprowadź hasło';
                  _isPasswordCorrect = false;
                });
              }

              if (widget.confirmPasswordController.text.isNotEmpty) {
                if (widget.confirmPasswordController.text ==
                    widget.passwordController.text) {
                  setState(() {
                    _confirmPasswordMessage = '';
                    _isPasswordConfirmed = true;
                  });
                } else {
                  setState(() {
                    _confirmPasswordMessage = 'Hasła się nie zgadzają';
                    _isPasswordConfirmed = false;
                  });
                }
              } else {
                setState(() {
                  _confirmPasswordMessage = 'Potwierdź hasło';
                  _isPasswordConfirmed = false;
                });
              }

              if (_isCreatingAccount) {
                if (_isDomainCorrect &&
                    _isPasswordCorrect &&
                    _isPasswordConfirmed) {
                  try {
                    context.read<LoginCubit>().register(
                          email: widget.loginController.text.trim(),
                          password: widget.passwordController.text.trim(),
                        );
                    context.read<LoginCubit>().createUserProfile();
                  } catch (error) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     duration: const Duration(seconds: 4),
                    //     backgroundColor: Colors.red,
                    //     content: Text('$error'),
                    //   ),
                    // );
                  }
                }
              } else {
                if (_isDomainCorrect && _isPasswordCorrect) {
                  context.read<LoginCubit>().signIn(
                        email: widget.loginController.text.trim(),
                        password: widget.passwordController.text.trim(),
                      );
                }
              }
            },
          );
        },
      ),
    );
  }
}

//TODO: Organize the login page code
//TODO: Add email confirmation while registering

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
    required this.appFooter,
    required this.loginController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isCreatingAccount,
    required this.onLoginAndRegisterSwitch,
    required this.onLoginButtonTap,
    required this.loginMessage,
    required this.passwordMessage,
    required this.confirmPasswordMessage,
  });

  final String appFooter;
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isCreatingAccount;
  final void Function() onLoginAndRegisterSwitch;
  final void Function() onLoginButtonTap;
  final String loginMessage;
  final String passwordMessage;
  final String confirmPasswordMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              right: 15,
              child: Text(
                appFooter,
                style: GoogleFonts.lato(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.20,
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: 15,
                right: 15,
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        isCreatingAccount ? 'Zarejestruj się' : 'Zaloguj się',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        isCreatingAccount
                            ? 'Witaj! Zarejestruj się, aby kontynuować.'
                            : 'Witaj! Zaloguj się, aby kontynuować.',
                        style: GoogleFonts.lato(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        children: [
                          Text(
                            isCreatingAccount
                                ? 'Masz konto?  '
                                : 'Nie masz konta?  ',
                            style: GoogleFonts.lato(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          InkWell(
                            onTap: onLoginAndRegisterSwitch,
                            child: Text(
                              isCreatingAccount
                                  ? 'Zaloguj się'
                                  : 'Zarejestruj się',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: loginController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    minLines: 1,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        isCreatingAccount ? 'Podaj e-mail' : 'Login (e-mail)',
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: loginMessage == '' ? false : true,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        loginMessage,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 202, 13, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    minLines: 1,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        isCreatingAccount ? 'Ustaw hasło' : 'Hasło',
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: passwordMessage == '' ? false : true,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        passwordMessage,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 202, 13, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCreatingAccount ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      minLines: 1,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          'Potwierdź hasło',
                          style: GoogleFonts.lato(
                            color: Colors.white70,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCreatingAccount && confirmPasswordMessage != ''
                      ? true
                      : false,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        confirmPasswordMessage,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 202, 13, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCreatingAccount ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Nie pamiętasz hasła?',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                  child: ElevatedButton(
                    onPressed: onLoginButtonTap,
                    child: Text(
                      isCreatingAccount ? 'ZAREJESTRUJ' : 'ZALOGUJ',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
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
