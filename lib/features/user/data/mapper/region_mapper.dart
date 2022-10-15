import 'package:c2u/features/user/data/model/region_model.dart';
import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class RegionMapper extends Mapper<Region, RegionModel> {
  @override
  Region mapModeltoEntity(RegionModel model) {
    Region region = Region(
      regionId: model.regionId,
      region: model.region,
    );
    return region;
  }
}
