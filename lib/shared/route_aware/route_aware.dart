import 'package:c2u/shared/route_aware/route_observer.dart';
import 'package:flutter/material.dart';

abstract class RouteAwareState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void didPush() {}

  @override
  void didPopNext() {}

  @override
  void didPop() {}

  @override
  void didPushNext() {}

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
