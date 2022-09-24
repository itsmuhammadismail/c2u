import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class DashboardMapper extends Mapper<Dashboard, DashboardModel> {
  @override
  Dashboard mapModeltoEntity(DashboardModel model) {
    Dashboard dashboard = Dashboard(
      approvedExcessWork: model.approvedExcessWork,
      finishedJobs: model.finishedJobs,
      jobsAllocated: model.jobsAllocated,
      jobsRunning: model.jobsRunning,
      openJobs: model.openJobs,
      pendingExcessWork: model.pendingExcessWork,
    );
    return dashboard;
  }
}
