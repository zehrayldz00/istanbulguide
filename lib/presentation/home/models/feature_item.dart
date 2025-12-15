import 'package:flutter/material.dart';

class FeatureItem {
  final String imagePath;
  final String title;
  final Widget destinationPage;

  FeatureItem({
    required this.imagePath,
    required this.title,
    required this.destinationPage,
  });
}
