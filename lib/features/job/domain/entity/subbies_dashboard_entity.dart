import 'package:equatable/equatable.dart';

class SubbiesDashboard extends Equatable {
  final int? acceptedJobs, pendingJobs, completedJobs;

  const SubbiesDashboard({
    required this.acceptedJobs,
    required this.pendingJobs,
    required this.completedJobs,
  });

  factory SubbiesDashboard.initial() => const SubbiesDashboard(
        acceptedJobs: null,
        pendingJobs: null,
        completedJobs: null,
      );

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  // factory SubbiesDashboard.fromJson(Map<String, dynamic> json) {
  //   return SubbiesDashboard(
  //     acceptedJobs: json['acceptedJobs'],
  //     pendingJobs: json['pendingJobs'],
  //     completedJobs: json['completedJobs'],
  //   );
  // }
}
