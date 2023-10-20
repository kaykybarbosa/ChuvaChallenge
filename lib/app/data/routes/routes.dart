import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:chuva_dart/app/data/routes/routes_constants.dart';
import 'package:chuva_dart/app/pages/activity_page.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:chuva_dart/providers.dart';
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
    GoRoute(
      name: AppRoutesConstants.eventRouteName,
      path: '/activity/:eventId',
      builder: (context, state) {
        final eventId = int.parse(state.pathParameters['eventId']!);

        final event = getIt<EventController>().getEventById(eventId);

        return Activity(event: event);
      },
    ),
    GoRoute(
      name: AppRoutesConstants.profileRouteName,
      path: "/profile/:peopleId",
      pageBuilder: (context, state) {
        final peopleId = int.parse(state.pathParameters['peopleId']!);

        final people = getIt<EventController>().getPeopleById(peopleId);

        return MaterialPage(
          child: ProfilePage(people: people),
          fullscreenDialog: true
        );
      }
    )
  ]
);