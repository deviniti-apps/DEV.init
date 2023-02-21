import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/application/app_const.dart';
import 'package:presentation/components/auth/bloc/auth_bloc.dart';

class SplashScreen extends HookWidget {
  static const String routeName = '/';

  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: AppMotion.splashAnimation);

    useEffect(
      () {
        void listener(status) {
          if (status == AnimationStatus.completed) {
            context.read<AuthBloc>().add(const AuthEvent.onInitiated());
          }
        }

        controller.addStatusListener(listener);
        return () => controller.removeStatusListener(listener);
      },
      [controller],
    );

    controller.forward();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            child: const Center(
              child: Text('Splash screen'),
            ),
            builder: (context, child) => Transform.rotate(
              angle: controller.value * 2.0 * math.pi,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
