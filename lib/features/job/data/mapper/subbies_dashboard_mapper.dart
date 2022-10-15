import 'package:c2u/features/job/data/model/subbies_dashboard_model.dart';
import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class SubbiesDashboardMapper
    extends Mapper<SubbiesDashboard, SubbiesDashboardModel> {
  @override
  SubbiesDashboard mapModeltoEntity(SubbiesDashboardModel model) {
    SubbiesDashboard dashboard = SubbiesDashboard(
      acceptedJobs: model.acceptedJobs,
      pendingJobs: model.pendingJobs,
      completedJobs: model.completedJobs,
    );
    return dashboard;
  }
}
