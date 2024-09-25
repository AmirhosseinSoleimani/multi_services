import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_service/src/features/home/presentation/screens/home_screen.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/icon_bottom_sheet_example.dart';

class Routes {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routes({String? initialLocation})=> GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: initialLocation ?? HomeScreen.homeScreenPath,
    routes: [
      GoRoute(
          path: HomeScreen.homeScreenPath,
          name: HomeScreen.homeScreenName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child: const HomeScreen(),
            );
          }),
      GoRoute(
          path: '/lll',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
              child: const IconBottomSheetExample(),
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