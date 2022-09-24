// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final Dashboard dashboard;

  const DashboardState({required this.dashboard});

  factory DashboardState.initial() => DashboardState(
        dashboard: Dashboard.initial(),
      );

  @override
  List<Object> get props => [dashboard];

  @override
  bool get stringify => true;

  DashboardState copyWith({
    Dashboard? dashboard,
  }) {
    return DashboardState(
      dashboard: dashboard ?? this.dashboard,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'dashboard': dashboard.toMap(),
  //   };
  // }

  // factory DashboardState.fromMap(Map<String, dynamic> map) {
  //   return DashboardState(
  //     dashboard: Dashboard.fromMap(map['dashboard'] as Map<String,dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory DashboardState.fromJson(String source) => DashboardState.fromMap(json.decode(source) as Map<String, dynamic>);
}
