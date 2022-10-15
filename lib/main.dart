import 'package:c2u/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_live_51LjCUw2nPjA4rgNCovo6N6y6exBo1JQa8NGveLyQUFgW2x9vzyP4I5biuEcERsVEclwA3O9cN45YNwhKu9dQpDVw00BqWuqepB';
  await Stripe.instance.applySettings();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}
