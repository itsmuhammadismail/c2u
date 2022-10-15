import 'package:c2u/features/user/domain/entity/region_entity.dart';

class RegionModel extends Region {
   RegionModel({
    required int regionId,
    required String region,
  }) : super(
          regionId: regionId,
          region: region,
        );

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      regionId: json['region_id'],
      region: json['region'],
    );
  }
}
