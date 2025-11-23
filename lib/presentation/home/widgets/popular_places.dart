import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istanbulguidetwo/common/helper/images/image_display.dart';
import 'package:istanbulguidetwo/domain/popular/entity/popular.dart';

import '../../../common/bloc/populars/populars_display_cubit.dart';
import '../../../common/bloc/populars/populars_display_state.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/utils/size_config.dart';

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
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier(3)),
                  child: Align(alignment: Alignment.centerLeft,child: _mostPopularPlacesText()),
                ),
                SizedBox(height: SizeConfig.heightMultiplier(0.1),),
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
          fontSize: SizeConfig.textMultiplier(4),
        fontFamily: 'CircularStd',
        color: AppColors.subtitleHome
      ),
    );
  }

  Widget _popularPlacesList(List<PopularEntity> categories) {
    return SizedBox(
      height: SizeConfig.heightMultiplier(25),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: 5
          ),
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: SizeConfig.heightMultiplier(11),
                  width: SizeConfig.heightMultiplier(20),
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
                SizedBox(height: SizeConfig.heightMultiplier(1.5),),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.textMultiplier(4)
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: SizeConfig.widthMultiplier(3)),
          itemCount: categories.length
      ),
    );
  }
}
