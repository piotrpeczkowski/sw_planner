class UserModel {
  const UserModel({
    required this.userEmail,
    required this.userName,
    required this.userAvatarUrl,
    required this.lastProfileUpdate,
    required this.isFirstLogin,
  });
  final String userEmail;
  final String userName;
  final String userAvatarUrl;
  final DateTime lastProfileUpdate;
  final bool isFirstLogin;
}
