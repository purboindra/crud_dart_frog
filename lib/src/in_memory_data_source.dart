// ignore_for_file: public_member_api_docs

import 'package:learn_dart_frog/src/models/signup_model.dart';
import 'package:learn_dart_frog/src/sign_up_data_source.dart';
import 'package:uuid/uuid.dart';

// THIS INI METHOD IMPLEMENTS OF SIGNUPDATASOURCE
// FOR CRUD

class InMemoryDataSource implements SignUpDataSource {
  final _cache = <String, SignUpModel>{};

  @override
  Future<SignUpModel> createUser(SignUpModel signUpModel) async {
    final id = const Uuid().v4();
    final data = signUpModel.copyWith(id: id);
    _cache[id] = data;
    return data;
  }

  @override
  Future<void> deleteUser(String id) async {
    _cache.remove(id);
  }

  @override
  Future<List<SignUpModel>> readAllUser() async {
    return _cache.values.toList();
  }

  @override
  Future<SignUpModel> updateUser(SignUpModel signUpModel, String id) async {
    return _cache.update(id, (value) => signUpModel);
  }

  @override
  Future<SignUpModel> readById(String id) async {
    return _cache[id]!;
  }
}
