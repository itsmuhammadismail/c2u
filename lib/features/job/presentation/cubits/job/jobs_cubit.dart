// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/domain/usecase/get_subbies_jobs_usecase.dart';
import 'package:c2u/shared/error/failures.dart';
import 'package:c2u/shared/params/token_id_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final GetSubbiesJobsUseCase subbiesJobsUseCase;
  JobsCubit({
    required this.subbiesJobsUseCase,
  }) : super(JobsState.initial());

  Future<void> getSubbiesJobs(String token, String id, String role) async {
    emit(state.copyWith(status: JobStatus.loading));

    Either<Failure, List<Job>> jobs =
        await subbiesJobsUseCase.call(TokenIdParams(
      token: token,
      id: id,
      role: role,
    ));

    jobs.fold(
      (Failure failure) {
        emit(state.copyWith(
          status: JobStatus.error,
        ));
      },
      (List<Job> jobs) {
        emit(state.copyWith(
          status: JobStatus.loaded,
          jobs: jobs,
        ));
      },
    );
  }
}
