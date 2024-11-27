import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/authours/presentation/bloc/bloc/author_bloc.dart';
import 'package:flutter/material.dart';

class AuthoursList extends StatelessWidget {
  final AuthorLoaded state;
  const AuthoursList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.authors.length,
        itemBuilder: (context, index) {
          final author = state.authors[index];
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(9)),
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
                          text: author.name.substring(0, 1).toUpperCase(),
                          size: 18,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    CustomSizedBoxWidth(getProportionateScreenWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSizedBoxHeight(getProportionateScreenHeight(9)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              width: getProportionateScreenWidth(269),
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
                        CustomSizedBoxHeight(getProportionateScreenHeight(9)),
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
}
