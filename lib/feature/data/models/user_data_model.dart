import 'package:test_app/feature/domain/entities/user_data.dart';

class UserDataModel extends UserDataEntiti {
  UserDataModel({
    required String accessToken,
    required String refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
