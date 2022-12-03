import 'package:bloc/bloc.dart';
import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';
import 'package:c2u/features/subscription/domain/usecase/invoices_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoicesUseCase invoicesUseCase;

  InvoiceCubit({
    required this.invoicesUseCase,
  }) : super(InvoiceState.initial());

  void initial() {
    emit(state.copyWith(status: InvoiceStatus.initial, invoices: []));
  }

  Future<void> allInvoices(String token) async {
    emit(state.copyWith(status: InvoiceStatus.loading));

    Either<Failure, List<Invoice>> invoice =
        await invoicesUseCase.call(TokenParams(token: token));

    invoice.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: InvoiceStatus.loaded,
        ));
      },
      (List<Invoice> invoices) {
        emit(state.copyWith(
          invoices: invoices,
        ));
      },
    );
  }
}
