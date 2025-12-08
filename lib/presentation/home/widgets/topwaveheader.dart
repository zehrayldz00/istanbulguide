import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import 'package:istanbulguidetwo/domain/auth/entity/user.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_state.dart';

class TopWaveHeader extends StatelessWidget {
  const TopWaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(height: 115.h, color: const Color(0xFF7FA9BB),
            ),
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
          Positioned(left: 22.5.w, top: 65.h, child: _subTitle()),
        ],
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
