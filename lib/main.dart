import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_video_screen_assignment_task/core/common_elements/error_text.dart';
import 'package:reddit_video_screen_assignment_task/core/common_elements/loader.dart';
import 'package:reddit_video_screen_assignment_task/core/models/user_model.dart';
import 'package:reddit_video_screen_assignment_task/core/routes/logged_in_routes.dart';
import 'package:reddit_video_screen_assignment_task/core/routes/logged_out_routes.dart';
import 'package:reddit_video_screen_assignment_task/core/theme/app_colors.dart';
import 'package:reddit_video_screen_assignment_task/features/auth/controller/auth_controller.dart';
import 'package:reddit_video_screen_assignment_task/features/auth/view/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routemaster/routemaster.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: RedditApp(),
    ),
  );
}

class RedditApp extends ConsumerStatefulWidget {
  const RedditApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RedditAppState();
}

class _RedditAppState extends ConsumerState<RedditApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;

    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Reddit Clone',
            theme: AppColors.darkModeAppTheme,
            routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
              if (data != null) {
                getData(ref, data);
                if (userModel != null) {
                  return loggedInRoutes;
                }
              }
              return loggedOutRoutes;
            }),
            routeInformationParser: const RoutemasterParser(),
          ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
