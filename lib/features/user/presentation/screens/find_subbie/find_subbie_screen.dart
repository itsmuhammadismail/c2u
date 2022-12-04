import 'package:c2u/features/job/domain/entity/job_entity.dart';
import 'package:c2u/features/job/presentation/cubits/job/jobs_cubit.dart';
import 'package:c2u/features/user/data/model/subbie_model.dart';
import 'package:c2u/features/user/domain/entity/region_entity.dart';
import 'package:c2u/features/user/domain/entity/subbie_entity.dart';
import 'package:c2u/features/user/domain/entity/trade_entity.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:c2u/shared/network/network.dart';
import 'package:c2u/shared/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class FindSubbieScreen extends StatelessWidget {
  const FindSubbieScreen({super.key});

  static String id = "find_subbie_screen";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Find Subbie',
      body: Body(),
    );
  }
}
