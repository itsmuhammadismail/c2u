import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';

class InvoiceModel extends Invoice {
  InvoiceModel({
    required String id,
    required String title,
    required String desc,
    required String amount,
    required String date,
    required String url,
  }) : super(
          id: id,
          title: title,
          desc: desc,
          amount: amount,
          date: date,
          url: url,
        );

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'],
      title: json['title'],
      desc: json['description'],
      amount: json['amount'],
      date: json['date'],
      url: json['invoice_url'],
    );
  }
}
