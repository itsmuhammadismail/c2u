import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final int id, contractorId, assignId, subbieId;
  final String name, desc, contractor, subbie, status, state, day;
  final String? workOrder;

  const Job({
    required this.id,
    required this.name,
    required this.desc,
    required this.contractor,
    required this.contractorId,
    required this.assignId,
    required this.subbie,
    required this.subbieId,
    required this.status,
    required this.state,
    required this.day,
    this.workOrder,
  });

  factory Job.initial() => const Job(
        id: 0,
        name: '',
        desc: '',
        contractor: '',
        contractorId: 0,
        assignId: 0,
        subbie: '',
        subbieId: 0,
        status: '',
        state: '',
        day: '',
        workOrder: null,
      );

  @override
  List<Object> get props => [
        id,
        name,
        desc,
        contractor,
        contractorId,
        assignId,
        subbie,
        subbieId,
        status,
        state,
        day
      ];

  @override
  bool get stringify => true;
}
