import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import 'package:istanbulguidetwo/domain/auth/entity/user.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:istanbulguidetwo/presentation/home/bloc/user_info_display_state.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/topwaveclipper.dart';

import '../../../core/utils/size_config.dart';

class TopWaveHeader extends StatelessWidget {
  const TopWaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.heightMultiplier(18),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return Row(
              children: [
                Stack(
                  children: [
                    PhysicalShape(
                      clipper: TopWaveClipper(),
                      color: const Color(0xFF7FA9BB),
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: SizedBox(width: w, height: h),
                    ),

                    BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
                      builder: (context, state) {
                        if (state is UserInfoLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is UserInfoLoaded) {
                          return Positioned(
                            left: w * 0.06,
                            bottom: h * 0.52,
                            child: _title(state.user, context),
                          );
                        }
                        return Container();
                      },
                    ),
                    Positioned(
                      left: w * 0.06,
                      bottom: h * 0.40,
                      child: _subTitle(),
                    ),
                    Positioned(
                      right: w * 0.06,
                      bottom: h * 0.20,
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
        fontSize: SizeConfig.textMultiplier(5),
      ),
    );
  }

  Widget _subTitle() {
    return Text(
      "Are you ready to explore the Istanbul!",
      style: TextStyle(
        fontFamily: 'CircularStd',
        color: AppColors.textColor,
        fontSize: SizeConfig.textMultiplier(3),
      ),
    );
  }
}
