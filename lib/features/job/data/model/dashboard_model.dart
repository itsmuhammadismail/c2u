import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';

class DashboardModel extends Dashboard {
  const DashboardModel({
    required int? jobsRunning,
    required int? jobsAllocated,
    required int? openJobs,
    required int? finishedJobs,
    required int? pendingExcessWork,
    required int? approvedExcessWork,
  }) : super(
          jobsRunning: jobsRunning,
          jobsAllocated: jobsAllocated,
          openJobs: openJobs,
          finishedJobs: finishedJobs,
          pendingExcessWork: pendingExcessWork,
          approvedExcessWork: approvedExcessWork,
        );

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      jobsRunning: json['data']['jobs_running'],
      jobsAllocated: json['data']['jobs_allocated'],
      openJobs: json['data']['open_jobs'],
      finishedJobs: json['data']['finished_jobs'],
      pendingExcessWork: json['data']['pending_excess_work'],
      approvedExcessWork: json['data']['approved_excess_work'],
    );
  }
}
