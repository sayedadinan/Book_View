import 'package:books_app/features/auth/presentation/pages/login_screen.dart';
import 'package:books_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:books_app/features/books/domain/entities/book.dart';
import 'package:books_app/features/books/presentation/pages/book_details_screen.dart';
import 'package:books_app/features/books/presentation/pages/bottom_bar.dart';
import 'package:go_router/go_router.dart';
//<<<<<<<<<<<<<----------------this is the app routing part from this it maintaining everything------------------------>>>>>>>>>>>>>>>>>>>>
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomBar(),
    ),
    GoRoute(
      path: '/book-details',
      builder: (context, state) {
        final bookDetails = state.extra as Book;
        return BookDetailsScreen(bookDetails: bookDetails);
      },
    ),
  ],
);
