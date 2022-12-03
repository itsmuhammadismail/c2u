import 'package:c2u/features/subscription/data/model/invoice_model.dart';
import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class InvoiceMapper extends Mapper<Invoice, InvoiceModel> {
  @override
  Invoice mapModeltoEntity(InvoiceModel model) {
    Invoice invoice = Invoice(
      id: model.id,
      title: model.title,
      desc: model.desc,
      amount: model.amount,
      date: model.date,
      url: model.url,
    );
    return invoice;
  }
}
