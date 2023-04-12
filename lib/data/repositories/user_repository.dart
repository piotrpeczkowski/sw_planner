import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sw_planner/domain/models/user_model.dart';

class UserRepository {
  // Future<UserModel> get({required String id}) async {
  //   final userId = FirebaseAuth.instance.currentUser?.uid;
  //   //final userEmail = FirebaseAuth.instance.currentUser?.email;
  //   if (userId == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   final doc = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .collection('user_profile')
  //       .doc('user_profile')
  //       .get();
  //   return UserModel(
  //     userEmail: doc['email'],
  //     userName: doc['name'],
  //     userAvatarUrl: doc['avatar_url'],
  //     lastProfileUpdate: doc['last_update'],
  //     isFirstLogin: doc['first_login'],
  //   );
  // }

  Stream<UserModel> userProfileStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('user_profile')
        .doc('user_profile')
        .snapshots()
        .map((snapshot) {
      final doc = snapshot;
      return UserModel(
        userEmail: doc['email'],
        userName: doc['name'],
        userAvatarUrl: doc['avatar_url'],
        lastProfileUpdate: (doc['last_update'] as Timestamp).toDate(),
        isFirstLogin: doc['first_login'],
      );
    });
  }

  Future<void> updateUserProfile({
    required String userName,
    required DateTime updateDate,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('user_profile')
        .doc('user_profile')
        .set(
      {
        'name': userName,
        'last_update': updateDate,
      },
      SetOptions(merge: true),
    );
  }

  Future<void> updatePassword({
    required String password,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      return;
    } else {
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
    }
  }

  Future<void> pickAndUploadImage({
    required String avatarUrl,
    required ImageSource source,
  }) async {
    final firebaseStorageReference = FirebaseStorage.instance.ref();
    final userID = FirebaseAuth.instance.currentUser!.uid;

    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(
      source: source,
      maxHeight: 350,
      maxWidth: 250,
    );

    if (file == null) return;

    Reference referenceRoot = firebaseStorageReference;
    Reference referenceDirImages = referenceRoot.child(userID);
    Reference referenceImageToUpload =
        referenceDirImages.child('avatar_$userID');

    try {
      await referenceImageToUpload.putFile(File(file.path));
      avatarUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {
      throw Exception(error);
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('user_profile')
        .doc('user_profile')
        .set(
      {
        'avatar_url': avatarUrl,
      },
      SetOptions(merge: true),
    );
  }
}
