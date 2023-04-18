import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.isCreatingAccount,
    required this.onLoginAndRegisterSwitch,
  });

  final bool isCreatingAccount;
  final void Function() onLoginAndRegisterSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                isCreatingAccount ? 'Masz konto?  ' : 'Nie masz konta?  ',
                style: GoogleFonts.lato(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              InkWell(
                onTap: onLoginAndRegisterSwitch,
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
    );
  }
}
