import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';
import 'package:books_app/features/authours/presentation/widgets/author_list_shimmer.dart';
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
            const Row(
              children: [
                CustomText(
                  color: AppColors.blackColor,
                  size: 24,
                  text: 'Authors',
                  weight: FontWeight.w500,
                ),
              ],
            ),
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.authors.length,
                    itemBuilder: (context, index) {
                      final author = state.authors[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(9)),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 220, 220, 220),
                              ),
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                              children: [
                                const CustomSizedBoxWidth(9),
                                CircleAvatar(
                                  backgroundColor: AppColors.colorList[index],
                                  maxRadius: 25,
                                  child: Center(
                                    child: CustomText(
                                      text: author.name
                                          .substring(0, 1)
                                          .toUpperCase(),
                                      size: 18,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                                CustomSizedBoxWidth(
                                    getProportionateScreenWidth(10)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomSizedBoxHeight(
                                        getProportionateScreenHeight(9)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: author.name,
                                          size: 13,
                                          color: AppColors.blackColor,
                                          weight: FontWeight.w400,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(269),
                                          child: CustomText(
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            text: author.biography,
                                            size: 11,
                                            color: AppColors.greyColor,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomSizedBoxHeight(
                                        getProportionateScreenHeight(9)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
