// ignore_for_file: one_member_abstracts, public_member_api_docs

import 'package:learn_dart_frog/src/models/signup_model.dart';

// THIS TO DECLARATED A METHOD OF
// C R U D

abstract class SignUpDataSource {
  Future<SignUpModel> createUser(SignUpModel signUpModel);

  Future<List<SignUpModel>> readAllUser();

  Future<SignUpModel> updateUser(SignUpModel signUpModel, String id);

  Future<void> deleteUser(String id);

  Future<SignUpModel> readById(String id);
}
