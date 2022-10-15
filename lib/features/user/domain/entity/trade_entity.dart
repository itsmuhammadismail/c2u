import 'package:equatable/equatable.dart';

class Trade extends Equatable {
  final int tradeId;
  final String trade;
  bool checked = false;

  Trade({
    required this.tradeId,
    required this.trade,
  });

  factory Trade.initial() => Trade(
        tradeId: 0,
        trade: "",
      );

  @override
  List<Object?> get props => [tradeId, trade];
}
