import 'package:chuva_dart/app/pages/activity_page.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: "/calendar",
  routes: [
    GoRoute(
      path: "/calendar",
      pageBuilder: (context, state) => const MaterialPage(child: Calendar(), fullscreenDialog: true),
    ),
    GoRoute(
      path: "/activity",
      pageBuilder: (context, state) => const MaterialPage(child: Activity(), fullscreenDialog: false),
    ),
    // GoRoute(path: "/profile",
    // pageBuilder: (context, state) => const MaterialPage(child: ProfilePage()),)
  ]
);