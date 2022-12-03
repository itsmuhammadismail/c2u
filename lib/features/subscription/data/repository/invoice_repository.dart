import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, List<Invoice>>> allInvoices({
    required String token,
  });
}
