import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
      childAspectRatio: 0.7,

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [],


    );
  }
}
