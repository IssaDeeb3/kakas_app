import '../../../core/data/remote/response/api_strings.dart';

class MainUserModel {
  final String? jwt;
  final String userName;
  final String? password;

  const MainUserModel({
    this.jwt,
    this.userName = '',
    this.password,
  });

  factory MainUserModel.fromJson(Map<dynamic, dynamic> json) {
    return MainUserModel(
      jwt: json[ApiStrings.jwt],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiStrings.username: userName,
      ApiStrings.password: password,
    };
  }

  factory MainUserModel.empty() => const MainUserModel();
}
