import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';

class SubbiesDashboardModel extends SubbiesDashboard {
  const SubbiesDashboardModel({
    required int? acceptedJobs,
    required int? pendingJobs,
    required int? completedJobs,
  }) : super(
          acceptedJobs: acceptedJobs,
          pendingJobs: pendingJobs,
          completedJobs: completedJobs,
        );

  factory SubbiesDashboardModel.fromJson(Map<String, dynamic> json) {
    return SubbiesDashboardModel(
      acceptedJobs: json['data']['accepted_jobs_requests'],
      pendingJobs: json['data']['pending_jobs_requests'],
      completedJobs: json['data']['completed_jobs_requests'],
    );
  }
}
