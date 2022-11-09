import 'package:c2u/features/user/domain/entity/subbie_entity.dart';

class SubbieModel extends Subbie {
  const SubbieModel({
    required int id,
    required String name,
    required String email,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory SubbieModel.fromJson(Map<String, dynamic> json) {
    return SubbieModel(
      id: json['user_id'],
      name: json['fullname'],
      email: json['email'],
    );
  }
}
