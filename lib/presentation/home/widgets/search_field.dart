import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../search/pages/search_page.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.48.h,
      width: 337.5.w,
      child: TextField(
        readOnly: true,
        onTap: (){
          AppNavigator.push(context, const SearchPage());
        },
        style: TextStyle(
          fontFamily: 'CircularStd',
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.hintColor
          )

        ),
      ),
    );
  }
}
