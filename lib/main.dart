import 'package:books_app/core/route.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/rating_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/utils/shared_preference.dart';
import 'package:books_app/core/di.dart'; // Import DI setup
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart'; // Import the other BLoCs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize shared preferences
  await SharedPreferencesHelper.init();

  // Setup Dependency Injection (DI)
  setupDependencyInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppMediaquery().init(context);

    return MultiBlocProvider(
      providers: [
        // Registering AuthBloc
        BlocProvider<AuthBloc>(
          create: (_) =>
              getIt<AuthBloc>(), // Get the AuthBloc from DI container
        ),
        BlocProvider<AuthorBloc>(
          create: (_) =>
              getIt<AuthorBloc>(), // Get the AuthBloc from DI container
        ),
        BlocProvider<BookBloc>(
          create: (_) =>
              getIt<BookBloc>(), // Get the AuthBloc from DI container
        ),
        BlocProvider<RatingBloc>(
          create: (_) =>
              getIt<RatingBloc>(), // Get the AuthBloc from DI container
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: SplashScreen(),
      ),
    );
  }
}
// import 'dart:developer';

// import 'package:books_app/core/theme/color_scheme.dart';
// import 'package:books_app/core/utils/extentions.dart';
// import 'package:books_app/core/widgets/app_customsizedbox.dart';
// import 'package:books_app/core/widgets/app_texts.dart';
// import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BookScreen extends StatefulWidget {
//   const BookScreen({super.key});

//   @override
//   State<BookScreen> createState() => _BookScreenState();
// }

// class _BookScreenState extends State<BookScreen> {
//   final ScrollController _scrollController = ScrollController();
//   int currentPage = 1;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//     context.read<BookBloc>().add(FetchBooksEvent(currentPage, 10));
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       currentPage++;
//       context.read<BookBloc>().add(FetchBooksEvent(currentPage, 10));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Padding(
//         padding: EdgeInsets.only(
//             left: getProportionateScreenWidth(14),
//             right: getProportionateScreenWidth(14)),
//         child: Column(
//           children: [
//             const CustomSizedBoxHeight(34),
//             const Row(
//               children: [
//                 CustomText(
//                   color: AppColors.blackColor,
//                   size: 24,
//                   text: 'App name',
//                   weight: FontWeight.w500,
//                 ),
//               ],
//             ),
//             const CustomSizedBoxHeight(12),
//             const CupertinoSearchTextField(),
//             BlocBuilder<BookBloc, BookState>(
//               builder: (context, state) {
                // if (state is BookLoading) {
                //   return Center(child: CircularProgressIndicator());
                // } else if (state is BookLoaded) {
                //   log('Books loaded in UI: ${state.books}');
                //   if (state.books.isEmpty) {
                //     return const Center(
                //       child: Text('No books found'),
                //     );
                //   }
//                   return Expanded(
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.63,
//                         crossAxisSpacing: 3,
//                         mainAxisSpacing: 3,
//                       ),
//                       itemCount: 2,
//                       itemBuilder: (context, index) {
//                         final book = state.books[index];
//                         log('Rendering book: $book');
//                         return Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color.fromARGB(255, 173, 171, 171)
//                                     .withOpacity(0.1),
//                                 spreadRadius: 1,
//                                 blurRadius: 9,
//                                 offset: const Offset(0.5, 0.1),
//                               ),
//                             ],
//                             color: Colors.white,
//                           ),
//                           child: Column(
//                             children: [
//                               const CustomSizedBoxHeight(10),
//                               Container(
//                                 width: getProportionateScreenWidth(106),
//                                 height: getProportionateScreenHeight(160),
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(book
//                                         .coverPictureURL), // Replace key with actual one
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const CustomSizedBoxHeight(14),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     left: getProportionateScreenWidth(12)),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CustomText(
//                                           color: AppColors.blackColor,
//                                           size: 13,
//                                           text: book.title ?? 'Unknown Title',
//                                           weight: FontWeight.w500,
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         CustomText(
//                                           color: AppColors.blackColor,
//                                           size: 11,
//                                           text: book.title ?? 'Unknown Author',
//                                           weight: FontWeight.w400,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
