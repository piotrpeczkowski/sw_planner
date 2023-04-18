import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.passwordController,
    required this.isCreatingAccount,
  });

  final TextEditingController passwordController;
  final bool isCreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
