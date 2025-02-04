import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/bloc/authentication_bloc.dart';
import '../features/authentication/presentation/pages/login_page.dart';
import '../features/user_profile/presentation/pages/user_profile_page.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/',
          name: 'user_profile',
          builder: (context, state) {
            return const UserProfilePage();
          },
        ),
      ],
      redirect: _guard);

  static String? _guard(BuildContext context, GoRouterState state) {
    final bool loggingIn = state.matchedLocation == '/login';
    if (context.read<AuthenticationBloc>().state is! LoggedIn) {
      return '/login';
    }
    // If the user is logged in but still on the login page, send them to
    // the profile page
    if (loggingIn) {
      return '/';
    }
    return null;
  }
}
