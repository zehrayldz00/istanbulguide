import 'package:flutter/material.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import 'package:istanbulguidetwo/core/utils/size_config.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../search/pages/search_page.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier(4),
      width: SizeConfig.widthMultiplier(90),
      child: TextField(
        readOnly: true,
        onTap: (){
          AppNavigator.push(context, const SearchPage());
        },
        style: TextStyle(
          fontFamily: 'CircularStd',
          fontSize: SizeConfig.textMultiplier(2),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: SizeConfig.textMultiplier(2),
            color: AppColors.hintColor
          )

        ),
      ),
    );
  }
}
