// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignUpModel extends Equatable {
  SignUpModel({
    this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.job,
  }) : assert(id == null || id.isNotEmpty, 'id cannot be empty');

  final String? id;
  final String email;
  final String userName;
  final String fullName;
  final String job;

  SignUpModel copyWith({
    String? id,
    String? email,
    String? userName,
    String? fullName,
    String? job,
  }) {
    return SignUpModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      job: job ?? this.job,
    );
  }

  static SignUpModel fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  @override
  List<Object?> get props => [id, email, userName, fullName, job];
}
