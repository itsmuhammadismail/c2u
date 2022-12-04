import 'package:c2u/features/user/data/model/subbie_model.dart';
import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class SubbieMapper extends Mapper<Subbie, SubbieModel> {
  @override
  Subbie mapModeltoEntity(SubbieModel model) {
    Subbie subbie = Subbie(
      id: model.id,
      name: model.name,
      email: model.email,
      image: model.image,
    );
    return subbie;
  }
}
