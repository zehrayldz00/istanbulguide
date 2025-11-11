import 'package:flutter/material.dart';
import 'package:istanbulguidetwo/core/config/assets/app_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Image.asset(AppImages.top),
          Image.asset(AppImages.appLogo, height: 78, width: 45,)

        ],
      ),
    );
  }
}
