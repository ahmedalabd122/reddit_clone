import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_video_screen_assignment_task/core/common_elements/custom_paints.dart';
import 'package:reddit_video_screen_assignment_task/core/common_elements/loader.dart';
import 'package:reddit_video_screen_assignment_task/core/common_elements/login_icon_button.dart';
import 'package:reddit_video_screen_assignment_task/core/constants/constants.dart';
import 'package:reddit_video_screen_assignment_task/core/theme/app_colors.dart';
import 'package:reddit_video_screen_assignment_task/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.redditIconPath,
          height: AppBar().preferredSize.height,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(
                color: AppColors.blueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: const Size(500, 300),
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      Image.asset(
                        Constants.splashDesignPath,
                        height: 350,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'LogIn to the App',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SignInIconButton(),
              ],
            ),
    );
  }
}
