import 'package:c2u/features/subscription/data/datasource/invoice_remte_datasource.dart';
import 'package:c2u/features/subscription/data/mapper/invoice_mapper.dart';
import 'package:c2u/features/subscription/data/model/invoice_model.dart';
import 'package:c2u/features/subscription/data/repository/invoice_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';

class InvoiceRepositoryImpl extends InvoiceRepository {
  late InvoiceRemoteDataSource _remoteDataSource;
  late InvoiceMapper _mapper;

  InvoiceRepositoryImpl({
    required InvoiceRemoteDataSource invoiceRemoteDataSource,
    required InvoiceMapper invoiceMapper,
  }) {
    _remoteDataSource = invoiceRemoteDataSource;
    _mapper = invoiceMapper;
  }

  @override
  Future<Either<Failure, List<Invoice>>> allInvoices(
      {required String token}) async {
    try {
      print("pass in repository 0");
      List<InvoiceModel> invoiceModel =
          await _remoteDataSource.allSubscriptions(token);
      print("pass in repository 1");
      List<Invoice> result = invoiceModel
          .map<Invoice>((data) => _mapper.mapModeltoEntity(data))
          .toList();
      print("pass in repository 2");
      return Right(result);
    } catch (e) {
      print("fail in repository");
      return Left(ServerFailure(e.toString()));
    }
  }
}
