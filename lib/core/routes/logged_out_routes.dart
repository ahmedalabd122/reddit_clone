import 'package:flutter/material.dart';
import 'package:reddit_video_screen_assignment_task/features/auth/view/screens/login_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoutes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});
