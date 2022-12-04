import 'dart:convert';

import 'package:c2u/features/subscription/domain/entity/subscription_entity.dart';
import 'package:c2u/features/subscription/presentation/cubits/subscription/subscription_cubit.dart';
import 'package:c2u/features/subscription/presentation/screens/billing_subscription/widgets/subscription_card.dart';
import 'package:c2u/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:c2u/resources/typography.dart';
import 'package:c2u/shared/layout/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

part 'widgets/body.dart';

class BillingSubscriptionScreen extends StatefulWidget {
  const BillingSubscriptionScreen({Key? key}) : super(key: key);

  static String id = "billing_subscription_screen";

  @override
  State<BillingSubscriptionScreen> createState() =>
      _BillingSubscriptionScreenState();
}

class _BillingSubscriptionScreenState extends State<BillingSubscriptionScreen> {
  

  @override
  Widget build(BuildContext context) {
    print('hello');
    return const MainLayout(
      title: 'Plans',
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
