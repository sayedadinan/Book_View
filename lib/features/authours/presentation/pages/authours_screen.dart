import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_title_widget.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';
import 'package:books_app/features/authours/presentation/widgets/author_list_shimmer.dart';
import 'package:books_app/features/authours/presentation/widgets/author_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthoursScreen extends StatefulWidget {
  const AuthoursScreen({super.key});

  @override
  State<AuthoursScreen> createState() => _AuthoursScreenState();
}

class _AuthoursScreenState extends State<AuthoursScreen> {
  @override
  void initState() {
    context.read<AuthorBloc>().add(FetchAuthorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(14),
            right: getProportionateScreenWidth(14)),
        child: Column(
          children: [
            const CustomSizedBoxHeight(34),
            const TitleWidget(title: 'App name'),
            BlocBuilder<AuthorBloc, AuthorState>(builder: (context, state) {
              if (state is AuthorError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              if (state is AuthorLoading) {
                return const Expanded(
                  child: AuthorShimmer(),
                );
              } else if (state is AuthorLoaded) {
                if (state.authors.isEmpty) {
                  return const Center(
                    child: Text('No authors found'),
                  );
                }
                return AuthoursList(
                  state: state,
                );
              }

              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
