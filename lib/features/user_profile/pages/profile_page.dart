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
          _userNameController.text = state.userModel.userName;
          switch (state.status) {
            case Status.initial:
              return const ProgressIndicatorPage();
            case Status.loading:
              return const ProgressIndicatorPage();
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
                          userName: _userNameController.text,
                          updateDate: DateTime.now(),
                        );
                    Navigator.of(context).pop();
                  } catch (error) {
                    Navigator.of(context).pop();
                  }
                },
                openCamera: () {
                  context.read<ProfileCubit>().pickAndUploadAvatar(
                        avatarUrl: avatarUrl,
                        source: ImageSource.camera,
                      );
                },
                openGallery: () {
                  context.read<ProfileCubit>().pickAndUploadAvatar(
                        avatarUrl: avatarUrl,
                        source: ImageSource.gallery,
                      );
                },
              );
            case Status.error:
              return const ProgressIndicatorPage();
          }
        },
      ),
    );
  }
}

//TODO: Add email verification indicator

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
          Expanded(
            flex: 0,
            child: ProfileHeaderWidget(
              userAvatarUrl: userAvatarUrl,
              openCamera: openCamera,
              openGallery: openGallery,
              userName: userName,
              userEmail: userEmail,
            ),
          ),
          const Expanded(
            flex: 0,
            child: FlagSeparatorWidget(),
          ),
          Expanded(
            flex: 1,
            child: ProfileBodyWidget(
              isPageContentVisible: isPageContentVisible,
              userNameController: userNameController,
              lastProfileUpdate: lastProfileUpdate,
            ),
          ),
        ],
      ),
    );
  }
}
