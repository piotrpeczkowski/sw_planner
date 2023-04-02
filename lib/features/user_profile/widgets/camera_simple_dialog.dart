import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';

Future<void> avatarSourceDialog(
  BuildContext context,
  Function openCamera,
  Function openGallery,
) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => BlocProvider(
      create: (context) => ProfileCubit(UserRepository())..start(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SimpleDialog(
            title: Text(
              'Zrób zdjęcie',
              style: GoogleFonts.kanit(),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 5,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      openCamera();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Otwórz aparat',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 5,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      openGallery();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Otwórz Galerię',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    ),
  );
}
