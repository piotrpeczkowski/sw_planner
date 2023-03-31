import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
              );
            case Status.loading:
              return UserProfilePageBody(
                userName: 'Trwa wczytywanie',
                userEmail: '',
                userAvatarUrl: '',
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
              );
            case Status.success:
              return UserProfilePageBody(
                  userName: userModel.userName,
                  userEmail: userModel.userEmail,
                  userAvatarUrl: userModel.userAvatarUrl,
                  userNameController: _userNameController,
                  isPageContentVisible: true,
                  onSave: () {
                    Navigator.of(context).pop();
                  });
            case Status.error:
              return UserProfilePageBody(
                userName: 'Wystąpił błąd',
                userEmail: state.errorMessage,
                userAvatarUrl: '',
                userNameController: _userNameController,
                isPageContentVisible: false,
                onSave: null,
              );
          }
        },
      ),
    );
  }
}

class ProgressIndicatorPage extends StatelessWidget {
  const ProgressIndicatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil użytkownika', style: GoogleFonts.kanit()),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
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
    required this.userNameController,
    required this.isPageContentVisible,
    required this.onSave,
  });

  final String userName;
  final String userEmail;
  final String userAvatarUrl;
  final TextEditingController userNameController;
  final bool isPageContentVisible;
  final Function()? onSave;

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 13, 71, 161),
                  Color.fromARGB(255, 84, 152, 255)
                ],
              ),
            ),
            child: Column(
              children: [
                userAvatarUrl != ''
                    ? Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(userAvatarUrl),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.85),
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const ClipOval(
                            child: CircleAvatar(
                              radius: 60,
                              child: Opacity(
                                opacity: 0.6,
                                child: Image(
                                  height: 110,
                                  image: AssetImage('images/def_avatar.png'),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.85),
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                Visibility(
                  visible: userName == '' ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      userName,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    userEmail,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            height: 3,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          Visibility(
            visible: isPageContentVisible,
            child: ListView(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
