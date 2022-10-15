// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'subbies_dashboard_cubit.dart';

class SubbiesDashboardState extends Equatable {
  final SubbiesDashboard dashboard;

  const SubbiesDashboardState({required this.dashboard});

  factory SubbiesDashboardState.initial() => SubbiesDashboardState(
        dashboard: SubbiesDashboard.initial(),
      );

  @override
  List<Object> get props => [dashboard];

  @override
  bool get stringify => true;

  SubbiesDashboardState copyWith({
    SubbiesDashboard? dashboard,
  }) {
    return SubbiesDashboardState(
      dashboard: dashboard ?? this.dashboard,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'dashboard': dashboard.toMap(),
  //   };
  // }

  // factory SubbiesDashboardState.fromMap(Map<String, dynamic> map) {
  //   return SubbiesDashboardState(
  //     dashboard: Dashboard.fromMap(map['dashboard'] as Map<String,dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory SubbiesDashboardState.fromJson(String source) => SubbiesDashboardState.fromMap(json.decode(source) as Map<String, dynamic>);
}
