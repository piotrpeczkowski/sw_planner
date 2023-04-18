import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPasswordMessageWidget extends StatelessWidget {
  const ConfirmPasswordMessageWidget({
    super.key,
    required this.isCreatingAccount,
    required this.confirmPasswordMessage,
  });

  final bool isCreatingAccount;
  final String confirmPasswordMessage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isCreatingAccount && confirmPasswordMessage != '' ? true : false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.info_outline,
            color: Color.fromARGB(255, 202, 13, 0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              confirmPasswordMessage,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 202, 13, 0),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
