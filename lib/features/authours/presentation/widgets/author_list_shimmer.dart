import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:books_app/core/utils/extentions.dart';

class AuthorShimmer extends StatelessWidget {
  const AuthorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of shimmer items
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(9)),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 220, 220, 220),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  const CustomSizedBoxWidth(9),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    maxRadius: 25,
                  ),
                  CustomSizedBoxWidth(getProportionateScreenWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSizedBoxHeight(getProportionateScreenHeight(9)),
                      // Placeholder for name
                      Container(
                        height: 16,
                        width: getProportionateScreenWidth(120),
                        color: Colors.grey,
                      ),
                      CustomSizedBoxHeight(getProportionateScreenHeight(6)),
                      // Placeholder for biography
                      Container(
                        height: 12,
                        width: getProportionateScreenWidth(200),
                        color: Colors.grey,
                      ),
                      CustomSizedBoxHeight(getProportionateScreenHeight(6)),
                      Container(
                        height: 12,
                        width: getProportionateScreenWidth(150),
                        color: Colors.grey,
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
    );
  }
}
