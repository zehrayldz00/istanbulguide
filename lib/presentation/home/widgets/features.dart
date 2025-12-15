import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/presentation/home/constants/feature_item_list.dart';
import 'package:istanbulguidetwo/presentation/home/models/feature_item.dart';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _featureList(featureItems));
  }

  Widget _featureList(List<FeatureItem> featureItems) {
    return ListView.separated(
      shrinkWrap: false,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            AppNavigator.push(context, featureItems[index].destinationPage);
          },
          child: Container(
            height: 170.h,
            width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(90),
                  blurRadius: 7,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: 200.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage(featureItems[index].imagePath),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black.withAlpha(60),
                  ),
                  Center(
                    child: Text(
                      featureItems[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: featureItems.length,
    );
  }
}
