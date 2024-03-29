import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';
import 'package:markets_list/widgets/markets_screen_sliver.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blueBackgroundColor,
      body: MarketsScreenSliver(),
    );
  }
}
