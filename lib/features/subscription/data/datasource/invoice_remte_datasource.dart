import 'package:c2u/features/subscription/data/model/invoice_model.dart';
import 'package:c2u/shared/network/network.dart';

class InvoiceRemoteDataSource {
  Future<List<InvoiceModel>> allSubscriptions(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'subscription/invoice?page=1',
        token: token,
      );

      print(res['data']);

      List<InvoiceModel> invoices = res['data']['data']
          .map<InvoiceModel>((data) => InvoiceModel.fromJson(data))
          .toList();

      return invoices;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
