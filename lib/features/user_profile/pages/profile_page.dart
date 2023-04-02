import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';
import 'package:sw_planner/features/user_profile/pages/progress_indicator_page.dart';
import 'package:sw_planner/features/user_profile/widgets/profile_body_widget.dart';
import 'package:sw_planner/features/user_profile/widgets/profile_header_widget.dart';
import 'package:sw_planner/features/widgets/flag_separator_widget.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String avatarUrl = '';
    return BlocProvider(
      create: (context) => ProfileCubit(UserRepository())..start(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final userModel = state.userModel;
          if (userModel == null) {
            return const ProgressIndicatorPage();
          }
          _userNameController.text = state.userModel!.userName;
          switch (state.status) {
            case Status.initial:
              return UserProfilePageBody(
                userName: 'Szukam',
                userEmail: '',
                userAvatarUrl: '',
                lastProfileUpdate: DateTime.now(),
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
                openCamera: () {},
                openGallery: () {},
              );
            case Status.loading:
              return UserProfilePageBody(
                userName: 'Trwa wczytywanie',
                userEmail: '',
                userAvatarUrl: '',
                lastProfileUpdate: DateTime.now(),
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
                openCamera: () {},
                openGallery: () {},
              );
            case Status.success:
              return UserProfilePageBody(
                userName: userModel.userName,
                userEmail: userModel.userEmail,
                userAvatarUrl: userModel.userAvatarUrl,
                lastProfileUpdate: userModel.lastProfileUpdateFormatted(),
                userNameController: _userNameController,
                isPageContentVisible: true,
                onSave: () {
                  try {
                    context.read<ProfileCubit>().updateUserProfile(
                          _userNameController.text,
                          DateTime.now(),
                        );
                    Navigator.of(context).pop();
                  } catch (error) {
                    Navigator.of(context).pop();
                  }
                },
                openCamera: () {
                  context.read<ProfileCubit>().pickAndUploadAvatar(
                        avatarUrl,
                        ImageSource.camera,
                      );
                },
                openGallery: () {
                  context.read<ProfileCubit>().pickAndUploadAvatar(
                        avatarUrl,
                        ImageSource.gallery,
                      );
                },
              );
            case Status.error:
              return UserProfilePageBody(
                userName: '',
                userEmail: '',
                userAvatarUrl: '',
                lastProfileUpdate: DateTime.now(),
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
                openCamera: () {},
                openGallery: () {},
              );
          }
        },
      ),
    );
  }
}

class UserProfilePageBody extends StatelessWidget {
  const UserProfilePageBody({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userAvatarUrl,
    required this.lastProfileUpdate,
    required this.userNameController,
    required this.isPageContentVisible,
    required this.onSave,
    required this.openCamera,
    required this.openGallery,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;
  final dynamic lastProfileUpdate;
  final TextEditingController userNameController;
  final bool isPageContentVisible;
  final Function()? onSave;
  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil użytkownika', style: GoogleFonts.kanit()),
        actions: [
          IconButton(
            onPressed: onSave,
            tooltip: 'Zapisz',
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileHeaderWidget(
            userAvatarUrl: userAvatarUrl,
            openCamera: openCamera,
            openGallery: openGallery,
            userName: userName,
            userEmail: userEmail,
          ),
          const FlagSeparatorWidget(),
          ProfileBodyWidget(
            isPageContentVisible: isPageContentVisible,
            userNameController: userNameController,
            lastProfileUpdate: lastProfileUpdate,
          ),
        ],
      ),
    );
  }
}
