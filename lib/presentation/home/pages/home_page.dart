import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/features.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/search_field.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/topwaveheader.dart';

import '../widgets/popular_places.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            TopWaveHeader(),
            SizedBox(height: 10.h),
            SearchField(),
            SizedBox(height: 15.h),
            PopularPlaces(),
            Features()
          ]
      ),
    );
  }
}