// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/features/home/presentation/view_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookly/features/home/presentation/views/home_view.dart';
import 'package:my_bookly/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KBookDetailesView = '/bookDetailesView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: KHomeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: KBookDetailesView,
      builder: (BuildContext context, GoRouterState state) {
        return BookDetailesView(
          bookModel: state.extra as BookModel,
        );
      },
    ),
  ]);
}
