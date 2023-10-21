import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
import 'package:my_bookly/features/home/presentation/view_model/featured_book_cubit/book_featured_cubit.dart';
import 'package:my_bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:sizer/sizer.dart';

void main() {
  ServiceLocator.setup();
  runApp(const MyBooklyApp());
}

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      NewestBooksCubit(ServiceLocator.getIt<HomeRepo>())
                        ..fectchNewestBooks(),
                ),
                BlocProvider(
                  create: (context) =>
                      FeaturedBookCubit(ServiceLocator.getIt<HomeRepo>())
                        ..fectchFeaturedBooks(),
                ),
              ],
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Bookly',
                theme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: MyConstants.KprimaryColor,
                    progressIndicatorTheme:
                        const ProgressIndicatorThemeData(color: Colors.white),
                    textTheme: GoogleFonts.montserratTextTheme(
                        ThemeData.dark().textTheme)),
                routerConfig: AppRouter.router,
                // home: const SplashView(),
              ),
            ));
  }
}
