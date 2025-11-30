import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import 'package:istanbulguidetwo/domain/auth/entity/user.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_state.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/topwaveclipper.dart';

class TopWaveHeader extends StatelessWidget {
  const TopWaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: SizedBox(
        width: double.infinity,
        height: 146.16.h,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Stack(
                  children: [
                    PhysicalShape(
                      clipper: TopWaveClipper(),
                      color: const Color(0xFF7FA9BB),
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: SizedBox(width: 375.w, height: 812.h),
                    ),

                    BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
                      builder: (context, state) {
                        if (state is UserInfoLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is UserInfoLoaded) {
                          return Positioned(
                            left: 22.5.w,
                            top: 40.h,
                            child: _title(state.user, context),
                          );
                        }
                        return Container();
                      },
                    ),
                    Positioned(
                      left: 22.5.w,
                      top: 65.h,
                      child: _subTitle(),
                    ),
                    Positioned(
                      right: 10.w,
                      top: 32.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(shape: CircleBorder(),),
                        child: Icon(Icons.menu),
                      ),
                    ),
                    Positioned(
                      right: 25.w,
                      top: 75.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _title(UserEntity user, BuildContext context) {
    return Text(
      "Hi, ${user.firstName}",
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _subTitle() {
    return Text(
      "Are you ready to explore the Istanbul!",
      style: TextStyle(
        fontFamily: 'CircularStd',
        color: AppColors.textColor,
        fontSize: 12.sp,
      ),
    );
  }
}
