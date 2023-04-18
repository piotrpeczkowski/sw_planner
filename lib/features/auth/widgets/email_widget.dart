import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.emailController,
    required this.isCreatingAccount,
  });

  final TextEditingController emailController;
  final bool isCreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: emailController,
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
    );
  }
}
