import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/common/helper/images/image_display.dart';
import 'package:istanbulguidetwo/domain/popular/entity/popular.dart';

import '../../../common/bloc/populars/populars_display_cubit.dart';
import '../../../common/bloc/populars/populars_display_state.dart';
import '../../../core/config/theme/app_colors.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularsDisplayCubit()..displayPopulars(),
      child: BlocBuilder<PopularsDisplayCubit, PopularsDisplayState>(
        builder: (context, state) {
          if (state is PopularsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PopularsLoaded) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 11.25.w),
                  child: Align(alignment: Alignment.centerLeft,child: _mostPopularPlacesText()),
                ),
                SizedBox(height: 0.812.h),
                _popularPlacesList(state.populars),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _mostPopularPlacesText() {
    return Text(
      'Most Popular Places',
      style: TextStyle(
          fontSize: 14.sp,
        fontFamily: 'CircularStd',
        color: AppColors.subtitleHome
      ),
    );
  }

  Widget _popularPlacesList(List<PopularEntity> categories) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: 5
          ),
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: 90.h,
                  width: 150.w,
                  decoration:BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          ImageDisplayHelper.generatePopularsImageURL(categories[index].image)
                        )
                    )
                  ),
                ),
                SizedBox(height: 12.18.h),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: AppColors.clickableNames
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 11.25.w),
          itemCount: categories.length
      ),
    );
  }
}
