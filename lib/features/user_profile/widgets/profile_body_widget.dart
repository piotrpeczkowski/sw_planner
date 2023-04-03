import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({
    super.key,
    required this.isPageContentVisible,
    required this.userNameController,
    required this.updatePasswordController,
    required this.lastProfileUpdate,
    required this.onPasswordUpdate,
  });

  final bool isPageContentVisible;
  final TextEditingController userNameController;
  final TextEditingController updatePasswordController;
  final dynamic lastProfileUpdate;
  final Function()? onPasswordUpdate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      children: [
        TextField(
          controller: userNameController,
          maxLines: 1,
          maxLength: 25,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            label: Text(
              'Nazwa użytkownika',
              style: GoogleFonts.lato(),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromARGB(255, 13, 71, 161),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Divider(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Ostatnio zaktualizowano:',
            style: GoogleFonts.lato(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              lastProfileUpdate,
              style: GoogleFonts.lato(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: updatePasswordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            minLines: 1,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: Text(
                'Ustaw nowe hasło',
                style: GoogleFonts.lato(),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 13, 71, 161),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPasswordUpdate,
          child: const Text('Aktualizuj'),
        ),
      ],
    );
  }
}
