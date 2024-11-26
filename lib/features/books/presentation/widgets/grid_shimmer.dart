import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:books_app/core/utils/extentions.dart'; // Replace with your actual extensions.

class GridShimmer extends StatelessWidget {
  const GridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(14),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          childAspectRatio: 0.56, // Adjust height/width ratio
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: 10, // Number of shimmer items
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shimmer for the image
                  Container(
                    height: getProportionateScreenHeight(160),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Shimmer for title
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8),
                    ),
                    child: Container(
                      height: 16,
                      width: getProportionateScreenWidth(120),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Shimmer for star and rating
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 16,
                          width: getProportionateScreenWidth(40),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Shimmer for price
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8),
                    ),
                    child: Container(
                      height: 16,
                      width: getProportionateScreenWidth(80),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
