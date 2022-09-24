import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  final int? jobsRunning,
      jobsAllocated,
      openJobs,
      finishedJobs,
      pendingExcessWork,
      approvedExcessWork;

  const Dashboard({
    required this.jobsRunning,
    required this.jobsAllocated,
    required this.openJobs,
    required this.finishedJobs,
    required this.pendingExcessWork,
    required this.approvedExcessWork,
  });

  factory Dashboard.initial() => const Dashboard(
        jobsRunning: null,
        jobsAllocated: null,
        openJobs: null,
        finishedJobs: null,
        pendingExcessWork: null,
        approvedExcessWork: null,
      );

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      jobsRunning: json['jobsRunning'],
      jobsAllocated: json['jobsAllocated'],
      openJobs: json['openJobs'],
      finishedJobs: json['finishedJobs'],
      pendingExcessWork: json['pendingExcessWork'],
      approvedExcessWork: json['approvedExcessWork'],
    );
  }
}
