import 'package:equatable/equatable.dart';

class Invoice extends Equatable {
  final String id, title, desc, amount, date, url;

  Invoice({
    required this.id,
    required this.title,
    required this.desc,
    required this.amount,
    required this.date,
    required this.url,
  });

  factory Invoice.initial() => Invoice(
        id: '',
        title: '',
        desc: '',
        amount: '',
        date: '',
        url: '',
      );

  @override
  List<Object?> get props => [id, title, desc, amount, date, url];

  @override
  bool get stringify => true;
}
