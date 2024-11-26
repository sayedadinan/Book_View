import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

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
                  text: 'App name',
                  weight: FontWeight.w500,
                ),
              ],
            ),
            const CustomSizedBoxHeight(12),
            const CupertinoSearchTextField(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  childAspectRatio: 0.63, // Adjust height/width ratio
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 173, 171, 171)
                              .withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 9,
                          offset: const Offset(0.5, 0.1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    width: getProportionateScreenWidth(179),
                    height: getProportionateScreenHeight(274),
                    child: Column(
                      children: [
                        const CustomSizedBoxHeight(10),
                        Container(
                          width: getProportionateScreenWidth(106),
                          height: getProportionateScreenHeight(160),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://m.media-amazon.com/images/I/81BE7eeKzAL._AC_UF1000,1000_QL80_.jpg'))),
                        ),
                        const CustomSizedBoxHeight(14),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(12)),
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    color: AppColors.blackColor,
                                    size: 13,
                                    text: 'Rich Dad Poor Dad',
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    color: AppColors.blackColor,
                                    size: 11,
                                    text: 'Robert T. Kiyosaki',
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  CustomText(
                                    color: AppColors.blackColor,
                                    size: 11,
                                    text: '4.0',
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    color: AppColors.blackColor,
                                    size: 13,
                                    text: '₹ 334.00',
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              CustomSizedBoxHeight(8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
