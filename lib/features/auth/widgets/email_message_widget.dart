import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailMessageWidget extends StatelessWidget {
  const EmailMessageWidget({
    super.key,
    required this.emailMessage,
  });

  final String emailMessage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: emailMessage == '' ? false : true,
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
              emailMessage,
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
