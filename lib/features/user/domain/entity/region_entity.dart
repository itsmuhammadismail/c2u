import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final int regionId;
  final String region;
 bool checked = false;

   Region({
    required this.regionId,
    required this.region,
  });

  factory Region.initial() =>  Region(
        regionId: 0,
        region: "",
      );

  @override
  List<Object?> get props => [regionId, region];
}
