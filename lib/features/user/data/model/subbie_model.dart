import 'package:c2u/features/user/domain/entity/subbie_entity.dart';

class SubbieModel extends Subbie {
  const SubbieModel({
    required int id,
    required String name,
    required String email,
    required String? image,
  }) : super(
          id: id,
          name: name,
          email: email,
          image: image,
        );

  factory SubbieModel.fromJson(Map<String, dynamic> json) {
    return SubbieModel(
        id: json['user_id'],
        name: json['fullname'],
        email: json['email'],
        image: json['profile_image']);
  }
}
