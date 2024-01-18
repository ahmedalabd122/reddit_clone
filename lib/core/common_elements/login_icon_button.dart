import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_video_screen_assignment_task/core/constants/constants.dart';
import 'package:reddit_video_screen_assignment_task/core/theme/app_colors.dart';
import 'package:reddit_video_screen_assignment_task/features/auth/controller/auth_controller.dart';

class SignInIconButton extends ConsumerWidget {
  const SignInIconButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        icon: Image.asset(
          Constants.googleIconPath,
          width: 30,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
      ),
    );
  }
}
