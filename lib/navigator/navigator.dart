import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomdecor/dashboard/dashboard.dart';
import 'package:roomdecor/profile/profile.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorshareKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorAddKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellE');
final StartGoRoutes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      // builder: (context, state, navigationShell) {
        // return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      // },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Dashboard(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorshareKey,
          routes: [
            GoRoute(
              path: '/share',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: profile(),
              ),
              routes: [],
            ),
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: _shellNavigatorAddKey,
        //   routes: [
        //     GoRoute(
        //       path: '/add',
        //       pageBuilder: (context, state) => const NoTransitionPage(
        //         child: EditNotes(),
        //       ),
        //       routes: [],
        //     ),
        //   ],
        // ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: profile(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: profile(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
