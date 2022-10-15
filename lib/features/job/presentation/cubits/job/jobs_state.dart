// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'jobs_cubit.dart';

enum JobStatus {
  initial,
  loading,
  loaded,
  error,
}

class JobsState extends Equatable {
  final JobStatus status;
  final List<Job> jobs;

  const JobsState({
    required this.status,
    required this.jobs,
  });

  factory JobsState.initial() => const JobsState(
        status: JobStatus.initial,
        jobs: [],
      );

  @override
  List<Object> get props => [status, jobs];

  @override
  bool get stringify => true;

  JobsState copyWith({
    JobStatus? status,
    List<Job>? jobs,
  }) {
    return JobsState(
      status: status ?? this.status,
      jobs: jobs ?? this.jobs,
    );
  }
}
