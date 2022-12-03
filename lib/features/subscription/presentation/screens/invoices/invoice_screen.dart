import 'dart:io';

import 'package:c2u/features/subscription/domain/entity/invoice_entity.dart';
import 'package:c2u/features/subscription/presentation/cubits/invoice/invoice_cubit.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

part 'widgets/body.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  static String id = "invoice_screen";

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Invoice',
      body: Body(),
    );
  }
}