import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          const CustomSizedBoxHeight(42),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(19)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.blackColor,
                    ))
              ],
            ),
          ),
          const CustomSizedBoxHeight(13),
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(300),
            color: AppColors.lightRoseColor,
            child: Center(
              child: SizedBox(
                height: getProportionateScreenHeight(260),
                width: getProportionateScreenWidth(171),
                child: Image.network(
                    'https://m.media-amazon.com/images/I/81BE7eeKzAL._AC_UF1000,1000_QL80_.jpg'),
              ),
            ),
          ),
          const CustomSizedBoxHeight(13),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(19),
                right: getProportionateScreenWidth(19)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      color: AppColors.blackColor,
                      size: 18,
                      text: 'Rich Dad Poor Dad',
                      weight: FontWeight.w600,
                    ),
                    Container(
                      width: getProportionateScreenWidth(48),
                      height: getProportionateScreenHeight(22),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: AppColors.lightGreyColor, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber[500],
                          ),
                          const CustomText(
                            color: AppColors.blackColor,
                            size: 13,
                            text: '4.0',
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const CustomText(
                  color: AppColors.blackColor,
                  size: 13,
                  text: 'by Robert T. Kiyosaki',
                  weight: FontWeight.w400,
                ),
                const CustomSizedBoxHeight(8),
                const CustomText(
                  color: AppColors.greyColor,
                  size: 11,
                  text: 'Published date: April 11, 2017',
                  weight: FontWeight.w400,
                ),
                const CustomSizedBoxHeight(8),
                const CustomText(
                  color: AppColors.blackColor,
                  size: 12,
                  text:
                      '''It's been nearly 25 years since Robert Kiyosaki’s Rich Dad Poor Dad first made waves in the Personal Finance arena. It has since become the #1 Personal Finance book of all time... translated into dozens of languages and sold around the world. ''',
                  weight: FontWeight.w400,
                ),
                const CustomText(
                  color: AppColors.blackColor,
                  size: 12,
                  text:
                      '''Rich Dad Poor Dad is Robert's story of growing up with two dads  his real father and the father of his best friend, his rich dad  and the ways in which both men shaped his thoughts about money and investing. The book explodes the myth that you need to earn a high income to be rich and explains the difference between working for money and having your money work for you.
''',
                  weight: FontWeight.w400,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(58),
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(top: BorderSide(color: AppColors.lightGreyColor))),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(14),
              right: getProportionateScreenWidth(14)),
          child: Column(
            children: [
              const CustomSizedBoxHeight(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    color: AppColors.blackColor,
                    size: 16,
                    text: '₹ 850.00',
                    weight: FontWeight.w700,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Container(
                      width: getProportionateScreenWidth(90),
                      height: getProportionateScreenHeight(30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.primaryColor),
                      child: const Center(
                        child: CustomText(
                          color: AppColors.whiteColor,
                          size: 13,
                          text: 'Add rating',
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const CustomSizedBoxHeight(10)
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    backgroundColor: AppColors.whiteColor,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const CustomSizedBoxHeight(12),
            const CustomText(
              color: AppColors.blackColor,
              size: 18,
              text: 'Add rating',
              weight: FontWeight.w600,
            ),
            const CustomSizedBoxHeight(12),
            Divider(
              color: AppColors.lightGreyColor,
            ),
            const CustomSizedBoxHeight(16),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const CustomSizedBoxHeight(16),
            Divider(
              color: AppColors.lightGreyColor,
            ),
            const CustomSizedBoxHeight(14),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: CustomText(
                  color: AppColors.whiteColor,
                  size: 12,
                  text: 'Submit',
                  weight: FontWeight.w600,
                ),
              ),
            ),
            const CustomSizedBoxHeight(20),
          ],
        ),
      );
    },
  );
}
