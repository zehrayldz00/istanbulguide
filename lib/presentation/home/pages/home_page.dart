import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/popular_places.dart';
import '../widgets/search_field.dart';
import '../widgets/topwaveheader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopWaveHeader(),
          SizedBox(height: 10.h),
          const SearchField(),
          SizedBox(height: 15.h),
          PopularPlaces(),
        ],
      ),
    );
  }
}
