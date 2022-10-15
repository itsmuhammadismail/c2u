import 'package:c2u/features/user/domain/entity/trade_entity.dart';

class TradeModel extends Trade {
   TradeModel({
    required int tradeId,
    required String trade,
  }) : super(
          tradeId: tradeId,
          trade: trade,
        );

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      tradeId: json['trade_id'],
      trade: json['trade'],
    );
  }
}
