import 'package:c2u/features/job/domain/entity/job_entity.dart';

class JobModel extends Job {
  const JobModel({
    required int id,
    required String name,
    required String desc,
    required String contractor,
    required int contractorId,
    required int assignId,
    required String subbie,
    required int subbieId,
    required String status,
    required String state,
    required String day,
    required String? workOrder,
  }) : super(
          id: id,
          name: name,
          desc: desc,
          contractor: contractor,
          contractorId: contractorId,
          assignId: assignId,
          subbie: subbie,
          subbieId: subbieId,
          status: status,
          state: state,
          day: day,
          workOrder: workOrder,
        );

  factory JobModel.fromJson(Map<String, dynamic> json, String role) {
    return role == 'contractor'
        ? JobModel(
            id: json['job_id'],
            name: json['title'].toString(),
            desc: json['description'].toString(),
            contractor: json['contractor'] == null
                ? ''
                : json['contractor']['fullname'].toString(),
            contractorId:
                json['contractor'] == null ? '' : json['contractor']['user_id'],
            assignId: json['assigned_jobs'] == null
                ? 0
                : int.parse(json['assigned_jobs'][0]['assign_id']) ?? 0,
            subbie: json['assigned_jobs'] == null
                ? ''
                : json['assigned_jobs'][0]['subbie']['fullname'] ?? '',
            subbieId: json['assigned_jobs'] == null
                ? 0
                : int.parse(json['assigned_jobs'][0]['subbie']['user_id'] ?? 0),
            status: json['status'].toString(),
            state: json['state'].toString(),
            day: json['start_date'].toString(),
            workOrder: json['documents'] == null
                ? null
                : json['documents'][0]['document_url'],
          )
        : JobModel(
            id: json['job']['job_id'],
            name: json['job']['title'].toString(),
            desc: json['job']['description'].toString(),
            contractor: json['job']['contractor']['fullname'].toString(),
            contractorId: json['job']['contractor']['user_id'],
            assignId: json['assign_id'],
            subbie: '',
            subbieId: 0,
            status: json['status'].toString(),
            state: json['job']['state'].toString(),
            day: json['job']['start_date'].toString(),
            workOrder: json['job']['documents'] == null
                ? null
                : json['job']['documents'][0]['document_url']);
  }
}
