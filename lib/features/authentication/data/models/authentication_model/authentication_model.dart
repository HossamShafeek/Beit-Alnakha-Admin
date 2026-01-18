import 'user.dart';

class AuthenticationModel {
  String? message;
  User? user;
  String? accessToken;
  String? refreshToken;
  String? role;
  String? displayName;

  AuthenticationModel({
    this.message,
    this.user,
    this.accessToken,
    this.role,
    this.refreshToken,
    this.displayName,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      role: json['role'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'user': user?.toJson()};
}
