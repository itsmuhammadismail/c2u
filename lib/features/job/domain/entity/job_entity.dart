import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final int id;
  final String name, desc, contractor, status, state, day;

  const Job({
    required this.id,
    required this.name,
    required this.desc,
    required this.contractor,
    required this.status,
    required this.state,
    required this.day,
  });

  factory Job.initial() => const Job(
        id: 0,
        name: '',
        desc: '',
        contractor: '',
        status: '',
        state: '',
        day: '',
      );

  @override
  List<Object> get props => [id, name, desc, contractor, status, state, day];

  @override
  bool get stringify => true;
}
