import 'package:books_app/core/route.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';
import 'package:books_app/features/authours/presentation/bloc/toggle_bloc/bloc/theme_bloc.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/rating_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/utils/shared_preference.dart';
import 'package:books_app/core/di.dart'; // Import DI setup
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ----------<<<<<<<<<<initialization of sharedpreference for geting anywhere of the app>>>>>>>>>>>----------------//
  await SharedPreferencesHelper.init();

  // --------=====Dependency Injection=====--------
  setupDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppMediaquery().init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider<AuthorBloc>(
          create: (_) => getIt<AuthorBloc>(),
        ),
        BlocProvider<BookBloc>(
          create: (_) => getIt<BookBloc>(),
        ),
        BlocProvider<RatingBloc>(
          create: (_) => getIt<RatingBloc>(),
        ),
        BlocProvider<ColorSwitchBloc>(
          create: (_) => ColorSwitchBloc(), // ThemeBloc for managing themes
        ),
      ],
      child: BlocBuilder<ColorSwitchBloc, ColorSwitchState>(
        builder: (context, state) {
          // Determine theme dynamically
          ThemeData themeData;
          if (state is ColorSwitchLightState) {
            themeData = ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            );
          } else if (state is ColorSwitchDarkState) {
            themeData = ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
              useMaterial3: true,
            );
          } else {
            themeData = ThemeData.light(); // Fallback theme
          }

          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeData,
          );
        },
      ),
    );
  }
}
