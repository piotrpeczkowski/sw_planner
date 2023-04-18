import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.onLoginButtonTap,
    required this.isCreatingAccount,
  });

  final void Function() onLoginButtonTap;
  final bool isCreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
