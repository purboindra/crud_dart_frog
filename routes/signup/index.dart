import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:learn_dart_frog/src/models/signup_model.dart';
import 'package:learn_dart_frog/src/sign_up_data_source.dart';

FutureOr<Response> onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return _get(context);
  } else if (context.request.method == HttpMethod.post) {
    return _post(context);
  } else {
    return Response(
      statusCode: HttpStatus.methodNotAllowed,
    );
  }
}

// FOR POST A NEW USER

Future<Response> _post(RequestContext context) async {
  final data = context.read<SignUpDataSource>();
  final signUp = SignUpModel.fromJson(await context.request.json());

  return Response.json(
    statusCode: HttpStatus.created,
    body: await data.createUser(signUp),
  );
}

// FOR GET ALL USER

Future<Response> _get(RequestContext context) async {
  final data = context.read<SignUpDataSource>();
  final signUp = await data.readAllUser();
  return Response.json(
    body: signUp,
  );
}
