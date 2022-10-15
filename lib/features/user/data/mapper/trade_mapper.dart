import 'package:c2u/features/user/data/model/trade_model.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class TradeMapper extends Mapper<Trade, TradeModel> {
  @override
  Trade mapModeltoEntity(TradeModel model) {
    Trade trade = Trade(
      tradeId: model.tradeId,
      trade: model.trade,
    );
    return trade;
  }
}
