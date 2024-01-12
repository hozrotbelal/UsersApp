import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';

class ShimmerHelper {
  buildBasicShimmer({double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: shimmerBase,
      highlightColor: shimmerHighlighted,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  buildListShimmer({itemCount = 10, itemHeight = 100.0}) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: ShimmerHelper().buildBasicShimmer(height: itemHeight),
        );
      },
    );
  }

  buildProductGridShimmer({scontroller, itemCount = 10}) {
    return GridView.builder(
      itemCount: itemCount,
      controller: scontroller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.7),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: shimmerBase,
            highlightColor: shimmerHighlighted,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  buildSquareGridShimmer({scontroller, itemCount = 10}) {
    return GridView.builder(
      itemCount: itemCount,
      controller: scontroller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: shimmerBase,
            highlightColor: shimmerHighlighted,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  buildCategoryGridShimmer({scontroller, itemCount = 10}) {
    return ListView.builder(
      itemCount: itemCount,
      controller: scontroller,
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 4,
      //   childAspectRatio: (1 / 1),
      // ),
      itemExtent: 120,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: shimmerBase, spreadRadius: 2, blurRadius: 5),
            ],
          ),
          margin: const EdgeInsets.all(3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 7,
              child: Shimmer.fromColors(
                baseColor: shimmerBase,
                highlightColor: shimmerHighlighted,
                // enabled: Provider.of<CategoryProvider>(context).categoryList.length == 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: shimmerBase,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: shimmerBase,
                    highlightColor: shimmerHighlighted,
                    //enabled: Provider.of<CategoryProvider>(context).categoryList.length == 0,
                    child: Container(height: 10, color: Colors.white, margin: const EdgeInsets.only(left: 15, right: 15)),
                  ),
                )),
          ]),
        );
      },
    );
  }
}
