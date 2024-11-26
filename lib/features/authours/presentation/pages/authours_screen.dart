import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/presentation/pages/book_details_screen.dart';
import 'package:flutter/material.dart';

class AuthoursScreen extends StatelessWidget {
  const AuthoursScreen({super.key});

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
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookDetailsScreen()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: getProportionateScreenHeight(9)),
                      child: Container(
                        width: double.infinity,
                        // height: getProportionateScreenHeight(60),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 220, 220, 220)),
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(9)),
                        child: Row(
                          children: [
                            const CustomSizedBoxWidth(9),
                            const CircleAvatar(
                              maxRadius: 25,
                              child: Center(
                                child: CustomText(
                                    text: 'R',
                                    size: 18,
                                    color: AppColors.blackColor),
                              ),
                            ),
                            CustomSizedBoxWidth(
                                getProportionateScreenWidth(10)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSizedBoxHeight(
                                    getProportionateScreenHeight(9)),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'James Clear',
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
                                      child: const CustomText(
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 2, // Limit to two lines
                                        text:
                                            'Lorem ipsum dolor sit amet consectetur. Phasellus amet placerat dictum mauris quam. At sagittis faucibus massa quam amet suscipit elementum neque nec. Duis natoque quam augue sit at et et quis. Ut et orci velit magna aliquam.',
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
            )
          ],
        ),
      ),
    );
  }
}
