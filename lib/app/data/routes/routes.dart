import 'package:chuva_dart/app/pages/activity_page.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: "/calendar/26",
  routes: [
    GoRoute(
      path: "/calendar/:day",
      pageBuilder: (context, state) {
        final day = int.parse(state.pathParameters['day']!);

        return MaterialPage(
            child: Calendar(currentDay: day), fullscreenDialog: true);
      },
    ),
    GoRoute(
      path: '/activity/:eventId',
      pageBuilder: (context, state) {
        final eventId = int.parse(state.pathParameters['eventId']!);

        final event = getIt<EventController>().getEventById(eventId);

        return MaterialPage(
            child: Activity(event: event), fullscreenDialog: true);
      },
    ),
    GoRoute(
        path: "/profile/:peopleId",
        builder: (context, state) {
          final peopleId = int.parse(state.pathParameters['peopleId']!);

          final people = getIt<EventController>().getPeopleById(peopleId);

          return ProfilePage(people: people);
        })
]);
