import 'package:flutter/material.dart';

class FeatureItem {
  final String title;
  final String imagePath;
  final Widget destinationPage;

  FeatureItem({
    required this.title,
    required this.imagePath,
    required this.destinationPage,
  });
}
