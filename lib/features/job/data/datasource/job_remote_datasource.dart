import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/features/job/data/model/job_model.dart';
import 'package:c2u/features/job/data/model/subbies_dashboard_model.dart';
import 'package:c2u/shared/network/network.dart';
import 'package:c2u/shared/params/create_job_params.dart';

class JobRemoteDataSource {
  Future<DashboardModel> dashboard(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'contractor_dashboard',
        token: token,
      );

      DashboardModel user = DashboardModel.fromJson(res);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubbiesDashboardModel> subbiesDashboard(String token) async {
    try {
      var res = await NetworkHelper.get(
        url: 'subbie_dashboard',
        token: token,
      );

      SubbiesDashboardModel user = SubbiesDashboardModel.fromJson(res);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<JobModel>> getSubbiesJobs(
      String token, String id, String role) async {
    String url =
        'assign_job/$id?orderby=id&orderdir=DESC&perpage=100&counts=&page=1tit';
    if (role == 'contractor') {
      url =
          'job?orderby=id&orderdir=DESC&perpage=100&counts=&contractor=$id&page=1';
    }

    try {
      var res = await NetworkHelper.get(
        url: url,
        token: token,
      );

      List<JobModel> jobs = res['data']['data']
          .map<JobModel>((job) => JobModel.fromJson(job, role))
          .toList();

      return jobs;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<bool> createJob(CreateJobParams params) async {
    Map<String, String> data = {
      'contractor': params.contractor,
      'trades[]': params.trade,
      'regions[]': params.region,
      'title': params.title,
      'address': params.address,
      'city': params.city,
      'state': params.state,
      'postal_code': params.postalCode,
      'start_date': params.startDate,
      'description': params.description,
      'status': params.status,
      'assign_job': params.assignJob,
    };
    print('document ${params.documents}');
    List<Map<String, String>> files = [];

    if (params.documents != '') {
      files.add({
        'file_name': 'documents[]',
        'file': params.documents,
      });
    }

    try {
      var res = await NetworkHelper.postWithDocuments(
        url: 'job/create',
        token: params.token,
        data: data,
        file: params.documents,
      );

      // List<JobModel> jobs = res['data']['data']
      //     .map<JobModel>((job) => JobModel.fromJson(job, role))
      //     .toList();

      return true;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
