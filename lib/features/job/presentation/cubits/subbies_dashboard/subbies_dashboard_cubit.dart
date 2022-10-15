// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:c2u/features/job/domain/entity/subbies_dashboard_entity.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_dashboard_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'subbies_dashboard_state.dart';

class SubbiesDashboardCubit extends Cubit<SubbiesDashboardState> {
  final GetSubbiesDashboardUseCase subbiesDashboardUseCase;

  SubbiesDashboardCubit({
    required this.subbiesDashboardUseCase,
  }) : super(SubbiesDashboardState.initial());

  Future<void> get(String token) async {
    Either<Failure, SubbiesDashboard> dashboard =
        await subbiesDashboardUseCase.call(TokenParams(
      token: token,
    ));

    dashboard.fold(
      (Failure failure) {
      },
      (SubbiesDashboard dashboard) {
        emit(state.copyWith(
          dashboard: dashboard,
        ));
      },
    );
  }
}
