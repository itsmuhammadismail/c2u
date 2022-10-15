import 'package:c2u/features/job/data/model/dashboard_model.dart';
import 'package:c2u/features/job/data/model/job_model.dart';
import 'package:c2u/features/job/data/model/subbies_dashboard_model.dart';
import 'package:c2u/shared/network/network.dart';

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
      rethrow;
    }
  }
}
