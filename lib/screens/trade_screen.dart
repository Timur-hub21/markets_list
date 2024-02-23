import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: AppColors.blueBackgroundColor,
        body: Center(
          child: Text(
            'Trade screen is currently unavailable',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
