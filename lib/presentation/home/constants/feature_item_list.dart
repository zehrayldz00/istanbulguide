import 'package:istanbulguidetwo/presentation/home/pages/home_page.dart';

import '../models/feature_item.dart';

final List<FeatureItem> featureItems = [
  FeatureItem(
    title: "Guide",
    imagePath: "assets/images/features/2.png",
    destinationPage: HomePage(),
  ),
  FeatureItem(
    title: "My Roadmap",
    imagePath: "assets/images/features/3.png",
    destinationPage: HomePage(),
  ),
  FeatureItem(
    title: "Transportation Guide",
    imagePath: "assets/images/features/4.png",
    destinationPage: HomePage(),
  ),
  FeatureItem(
    title: "For Fancier",
    imagePath: "assets/images/features/5.png",
    destinationPage: HomePage(),
  ),
];
