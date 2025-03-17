import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const EmptyState({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imageAsset, height: 200.h),
        SizedBox(height: 16.h),
        Text(title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        Text(description,
            style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center),
      ],
    );
  }
}
