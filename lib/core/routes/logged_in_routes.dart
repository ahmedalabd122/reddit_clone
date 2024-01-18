import 'package:flutter/material.dart';
import 'package:reddit_video_screen_assignment_task/features/home/view/screens/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
});
