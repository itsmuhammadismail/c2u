import 'package:c2u/features/job/data/model/job_model.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/shared/mapper/mapper.dart';

class JobMapper extends Mapper<Job, JobModel> {
  @override
  Job mapModeltoEntity(JobModel model) {
    Job dashboard = JobModel(
      id: model.id,
      contractor: model.contractor,
      contractorId: model.contractorId,
      assignId: model.assignId,
      subbie: model.subbie,
      subbieId: model.subbieId,
      day: model.day,
      name: model.name,
      desc: model.desc,
      state: model.state,
      status: model.status,
      workOrder: model.workOrder,
    );
    return dashboard;
  }
}
