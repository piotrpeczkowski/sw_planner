import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return LoginPageBody(
      loginController: widget.loginController,
      passwordController: widget.passwordController,
      confirmPasswordController: widget.confirmPasswordController,
      isCreatingAccount: _isCreatingAccount,
      onSignInAndRegisterSwitch: () {
        if (_isCreatingAccount) {
          setState(() {
            _isCreatingAccount = false;
          });
        } else {
          setState(() {
            _isCreatingAccount = true;
          });
        }
      },
    );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
    required this.loginController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isCreatingAccount,
    required this.onSignInAndRegisterSwitch,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isCreatingAccount;
  final void Function() onSignInAndRegisterSwitch;

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
        body: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.18,
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: 15,
            right: 15,
          ),
          children: [
            Column(
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
                        onTap: onSignInAndRegisterSwitch,
                        child: Text(
                          isCreatingAccount ? 'Zaloguj się' : 'Zarejestruj się',
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
              child: TextField(
                controller: loginController,
                keyboardType: TextInputType.emailAddress,
                minLines: 1,
                textInputAction: TextInputAction.done,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                minLines: 1,
                textInputAction: TextInputAction.done,
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
              visible: isCreatingAccount ? true : false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  minLines: 1,
                  textInputAction: TextInputAction.done,
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
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
