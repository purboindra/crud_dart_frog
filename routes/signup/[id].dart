import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:learn_dart_frog/src/models/signup_model.dart';
import 'package:learn_dart_frog/src/sign_up_data_source.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final data = context.read<SignUpDataSource>();
  final signUp = await data.readById(id);

  if (context.request.method == HttpMethod.get) {
    return _get(context, signUp);
  } else if (context.request.method == HttpMethod.delete) {
    return _deleteUser(context, id);
  } else if (context.request.method == HttpMethod.put) {
    return _updateUser(context, signUp, id);
  } else {
    return Response(
      body: 'Something went wront',
    );
  }
}

// FOR GET ALL USER

Future<Response> _get(RequestContext context, SignUpModel signUpModel) async {
  return Response.json(body: signUpModel);
}

// FOR UPDATE USER BY ID

Future<Response> _updateUser(
  RequestContext context,
  SignUpModel signUpModel,
  String id,
) async {
  final dataSource = context.read<SignUpDataSource>();
  final updateUser = SignUpModel.fromJson(await context.request.json());
  final newUser = await dataSource.updateUser(
    signUpModel.copyWith(
      userName: updateUser.userName,
      fullName: updateUser.fullName,
      email: updateUser.email,
      job: updateUser.job,
    ),
    id,
  );
  return Response.json(body: newUser);
}

// FOR DELETE USER

Future<Response> _deleteUser(RequestContext context, String id) async {
  final data = context.read<SignUpDataSource>();
  await data.deleteUser(id);
  return Response(statusCode: HttpStatus.noContent);
}
