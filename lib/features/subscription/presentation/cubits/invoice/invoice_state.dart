part of 'invoice_cubit.dart';

enum InvoiceStatus {
  initial,
  loading,
  loaded,
  error,
}

class InvoiceState extends Equatable {
  final InvoiceStatus status;
  final List<Invoice> invoices;

  const InvoiceState({
    required this.status,
    required this.invoices,
  });

  factory InvoiceState.initial() => const InvoiceState(
        status: InvoiceStatus.initial,
        invoices: [],
      );

  @override
  List<Object> get props => [status, invoices];

  @override
  bool get stringify => true;

  InvoiceState copyWith({
    InvoiceStatus? status,
    List<Invoice>? invoices,
  }) {
    return InvoiceState(
      status: status ?? this.status,
      invoices: invoices ?? this.invoices,
    );
  }
}

