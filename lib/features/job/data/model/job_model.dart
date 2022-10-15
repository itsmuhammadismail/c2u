import 'package:c2u/features/job/domain/entity/job_entity.dart';

class JobModel extends Job {
  const JobModel({
    required int id,
    required String name,
    required String desc,
    required String contractor,
    required String status,
    required String state,
    required String day,
  }) : super(
          id: id,
          name: name,
          desc: desc,
          contractor: contractor,
          status: status,
          state: state,
          day: day,
        );

  factory JobModel.fromJson(Map<String, dynamic> json, String role) {
    return role == 'contractor'
        ? JobModel(
            id: json['job_id'],
            name: json['title'].toString(),
            desc: json['description'].toString(),
            contractor: json['contractor']['fullname'].toString(),
            status: json['status'].toString(),
            state: json['state'].toString(),
            day: json['start_date'].toString(),
          )
        : JobModel(
            id: json['job']['job_id'],
            name: json['job']['title'].toString(),
            desc: json['job']['description'].toString(),
            contractor: json['job']['contractor']['fullname'].toString(),
            status: json['status'].toString(),
            state: json['job']['state'].toString(),
            day: json['job']['start_date'].toString(),
          );
  }
}
