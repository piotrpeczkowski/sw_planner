import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPasswordWidget extends StatelessWidget {
  const ConfirmPasswordWidget({
    super.key,
    required this.isCreatingAccount,
    required this.confirmPasswordController,
  });

  final bool isCreatingAccount;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
    );
  }
}
