import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/features/user/domain/entity/user_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class UserMapper extends Mapper<User, UserModel> {
  @override
  User mapModeltoEntity(UserModel model) {
    User user = User(
      id: model.id,
      trialedSubscription: model.trialedSubscription,
      type: model.type,
      fullName: model.fullName,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      phoneNumber: model.phoneNumber,
      token: model.token,
      label: model.label,
      status: model.status,
      profileImage: model.profileImage,
    );
    return user;
  }
}
