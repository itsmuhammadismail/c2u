import 'package:c2u/features/user/domain/entity/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required int? trialedSubscription,
    required String type,
    required String fullName,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String token,
    required String label,
    required String status,
    required String? profileImage,
  }) : super(
          id: id,
          trialedSubscription: trialedSubscription,
          type: type,
          fullName: fullName,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          token: token,
          label: label,
          status: status,
          profileImage: profileImage,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['user']['user_id'],
      trialedSubscription: json['data']['user']['trialed_subscription'],
      type: json['data']['user']['type'],
      fullName: json['data']['user']['fullname'],
      firstName: json['data']['user']['first_name'],
      lastName: json['data']['user']['last_name'],
      email: json['data']['user']['email'],
      phoneNumber: json['data']['user']['phone_number'],
      token: json['data']['authorisation']['token'],
      label: json['data']['user']['label'],
      status: json['data']['user']['status'],
      profileImage: json['data']['user']['profile_image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "trialedSubscription": trialedSubscription,
        "type": type,
        "fullName": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "token": token,
        "label": label,
        "status": status,
        "profileImage": profileImage,
      };
}
