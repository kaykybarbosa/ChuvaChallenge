import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/routes/routes_constants.dart';
import 'package:chuva_dart/app/pages/activity_page.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

final routes = GoRouter(
  initialLocation: "/calendar",
  routes: [
    GoRoute(
      name: AppRoutesConstants.calendarRouteName,
      path: "/calendar",
      pageBuilder: (context, state) => const MaterialPage(child: Calendar(), fullscreenDialog: true),
    ),
    GoRoute(
      path: '/activity/:eventId',
      builder: (context, state) {
      final eventId = state.pathParameters['eventId']!;

      // List<Event> events = getIt<EventController>().events.value;
      // final event = events.firstWhere((event) => event.id == eventId);

      print('ID_ROUTE${eventId is int}');
      

      return Activity(event: Event());
      },
    ),
    // GoRoute(
    //   name: AppRoutesConstants.eventRouteName,
    //   path: "/event/:eventId",
    //   pageBuilder: (context, state) => const MaterialPage(child: EventPage()),
    // ),
    GoRoute(
      name: AppRoutesConstants.profileRouteName,
      path: "/profile",
      pageBuilder: (context, state) => const MaterialPage(child: ProfilePage()),
    )
  ]
);