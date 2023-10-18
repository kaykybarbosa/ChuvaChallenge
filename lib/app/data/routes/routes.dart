import 'package:chuva_dart/app/data/routes/routes_constants.dart';
import 'package:chuva_dart/app/pages/activity_page.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:chuva_dart/app/pages/event_page.dart';
import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: "/calendar",
  routes: [
    GoRoute(
      name: AppRoutesConstants.calendarRouteName,
      path: "/calendar",
      pageBuilder: (context, state) => const MaterialPage(child: Calendar(), fullscreenDialog: true),
    ),
    // GoRoute(
    //   name: AppRoutesConstants.activityRouteName,
    //   path: "/activity",
    //   pageBuilder: (context, state) => const MaterialPage(
    //     child: Activity(),
    //      fullscreenDialog: false
    //   ),
    // ),
    GoRoute(
      path: '/activity/:eventId',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId']!;
        return Activity(textPath: eventId.toString());
      },
    ),
    GoRoute(
      name: AppRoutesConstants.eventRouteName,
      path: "/event",
      pageBuilder: (context, state) => const MaterialPage(child: EventPage()),
    ),
    GoRoute(
      name: AppRoutesConstants.profileRouteName,
      path: "/profile",
      pageBuilder: (context, state) => const MaterialPage(child: ProfilePage()),
    )
  ]
);