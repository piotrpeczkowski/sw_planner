import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordMessageWidget extends StatelessWidget {
  const PasswordMessageWidget({
    super.key,
    required this.passwordMessage,
  });

  final String passwordMessage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: passwordMessage == '' ? false : true,
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
              passwordMessage,
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
