
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/car_services_screen.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/add_car_screen.dart';
import 'package:super_app_behpardaz/src/features/car_services/presentation/widgets/violation_screen.dart';
import 'package:super_app_behpardaz/src/features/home/presentation/home_screen.dart';

class Routes {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routes({String? initialLocation})=> GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: initialLocation ?? ViolationScreen.violationScreenPath,
    routes: [
      GoRoute(
          path: CarServicesScreen.carServicesScreenPath,
          name: CarServicesScreen.carServicesScreenName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child: const CarServicesScreen(),
            );
          }),
      GoRoute(
          path: HomeScreen.homeScreenPath,
          name: HomeScreen.homeScreenName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child:  const HomeScreen(),
            );
          }),
      GoRoute(
          path: AddCarScreen.addCarScreenPath,
          name: AddCarScreen.addCarScreenName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child:  const AddCarScreen(),
            );
          }),
      GoRoute(
          path: ViolationScreen.violationScreenPath,
          name: ViolationScreen.violationScreenName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child:  const ViolationScreen(),
            );
          }),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}