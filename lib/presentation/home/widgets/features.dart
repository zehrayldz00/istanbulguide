import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/presentation/home/constants/feature_item_list.dart';
import 'package:istanbulguidetwo/presentation/home/models/feature_item.dart';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return _featureList(featureItems);
  }

  Widget _featureList(List<FeatureItem> featureItems) {
    const Color white = Colors.white;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            AppNavigator.push(context, featureItems[index].destinationPage);
          },
          child: Container(
            height: 140.h,
            width: 360.w,
            decoration: BoxDecoration(
              // Mavinin içeri sızmasını engelleyen siyah tabanımız
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.r),

              // İnce, net neon mavi çizgi
              border: Border.all(
                color: white,
                width: 2.2,
              ),


              boxShadow: [
                BoxShadow(
                  color: white.withAlpha(180),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Resim orijinal (İçi tertemiz)
                  Image.asset(
                    featureItems[index].imagePath,
                    fit: BoxFit.cover,
                  ),

                  // Başlık ve Okunabilirlik Gölgeleri
                  Center(
                    child: Text(
                      featureItems[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black.withAlpha(220),
                              blurRadius: 10,
                              offset: const Offset(2, 2),
                            ),
                            Shadow(
                              color: Colors.black,
                              blurRadius: 20,
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 25.h),
      itemCount: featureItems.length,
    );
  }
}