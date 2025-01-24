import 'package:shopyneer/core/models/global_response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/vaildData/valid_data.dart';

class AuthModel extends GlobalResponseModel with EquatableMixin {
  final AuthData userData;

  AuthModel({
    required super.message,
    required super.status,
    required this.userData,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userData: AuthData.fromJson(json['data']),
      message: json["message"],
      status: json['status'],
    );
  }

  @override
  List<Object?> get props => [
        userData,
      ];
}

class AuthData {
  final String message;
  final String code;
  final String username;
  final String phoneNumber;
  final String token;
  final bool isAuthenticated;

  AuthData({
    required this.message,
    required this.code,
    required this.username,
    required this.phoneNumber,
    required this.token,
    required this.isAuthenticated,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      message: validateString(json['message']?.toString()),
      code: validateString(json['code']?.toString()),
      username: validateString(json['username']?.toString()),
      phoneNumber: validateString(json['phoneNumber']?.toString()),
      token: validateString(json['token']?.toString()),
      isAuthenticated: json['isAuthenticated'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        if (validString(message)) 'message': message,
        if (validString(username)) 'username': username,
        if (validString(phoneNumber)) 'phoneNumber': phoneNumber,
        if (validString(token)) 'token': token,
        if (isAuthenticated) 'isAuthenticated': isAuthenticated,
        if (validString(code)) 'code': code,
      };
}
