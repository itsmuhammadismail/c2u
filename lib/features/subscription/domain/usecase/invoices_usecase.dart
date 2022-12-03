import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';
import 'package:c2u/features/subscription/domain/repository/invoice_repository_impl.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:c2u/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class InvoicesUseCase extends UseCase<List<Invoice>, TokenParams> {
  final InvoiceRepositoryImpl repository;

  InvoicesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Invoice>>> call(TokenParams params) {
    return repository.allInvoices(
      token: params.token,
    );
  }
}
