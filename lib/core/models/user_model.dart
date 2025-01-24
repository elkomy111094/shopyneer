import 'package:shopyneer/core/models/global_response_model.dart';
import 'package:equatable/equatable.dart';

import '../utils/vaildData/valid_data.dart';

class UserModel extends GlobalResponseModel with EquatableMixin {
  final UserData userData;

  UserModel({
    required super.message,
    required super.status,
    required this.userData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userData: UserData.fromJson(json['data']),
      message: json["message"],
      status: json['status'],
    );
  }

  @override
  List<Object?> get props => [
        userData,
      ];
}

class UserData {
  final String id;
  final String name;
  final String phone;
  final String token;
  final String avatarUrl;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.token,
    required this.avatarUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: validateString(json['id']?.toString()),
      name: validateString(json['name']?.toString()),
      phone: validateString(json['phone']?.toString()),
      token: validateString(json['token']?.toString()),
      avatarUrl: validateString(json['avatar_url']?.toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        if (validString(id)) 'id': id,
        if (validString(name)) 'name': name,
        if (validString(phone)) 'phone': phone,
        if (validString(token)) 'token': token,
        if (validString(token)) 'avatar_url': avatarUrl,
      };
}
