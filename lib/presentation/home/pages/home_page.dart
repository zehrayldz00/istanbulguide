import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/features.dart';
import 'package:istanbulguidetwo/presentation/home/widgets/topwaveheader.dart';

import '../widgets/popular_places.dart';
import '../widgets/side_menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideMenu(),
      body: Column(
          children: [
            const TopWaveHeader(),

            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      const PopularPlaces(),
                      const Features(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )
            )
          ]
      ),
    );
  }
}