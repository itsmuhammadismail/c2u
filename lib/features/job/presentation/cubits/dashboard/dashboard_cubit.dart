import 'package:bloc/bloc.dart';
import 'package:c2u/features/job/domain/entity/dashboard_entity.dart';
import 'package:c2u/features/job/domain/usecase/get_dashboard_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUseCase dashboardUseCase;

  DashboardCubit({
    required this.dashboardUseCase,
  }) : super(DashboardState.initial());

  Future<void> get(String token) async {
    Either<Failure, Dashboard> dashboard =
        await dashboardUseCase.call(TokenParams(
      token: token,
    ));

    dashboard.fold(
      (Failure failure) {
        print("error");
      },
      (Dashboard dashboard) {
        emit(state.copyWith(
          dashboard: dashboard,
        ));
      },
    );
  }
}
