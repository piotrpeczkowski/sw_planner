import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RemindPasswordWidget extends StatelessWidget {
  const RemindPasswordWidget({
    super.key,
    required this.isCreatingAccount,
  });

  final bool isCreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isCreatingAccount ? false : true,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              //TODO: Implement password remind method
            },
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
    );
  }
}
