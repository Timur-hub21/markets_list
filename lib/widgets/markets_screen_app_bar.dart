import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';

class MarketsScreenAppBar extends StatefulWidget {
  const MarketsScreenAppBar({super.key});

  @override
  State<MarketsScreenAppBar> createState() => _MarketsScreenAppBarState();
}

class _MarketsScreenAppBarState extends State<MarketsScreenAppBar> {
  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 250,
        backgroundColor: AppColors.blueBackgroundColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Markets',
                style: TextStyle(
                  color: AppColors.whiteBackgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoSearchTextField(
                padding: const EdgeInsets.symmetric(vertical: 13.5),
                prefixInsets: const EdgeInsets.symmetric(horizontal: 5),
                prefixIcon: Icon(Icons.search, size: 32, color: Colors.grey.shade400),
                backgroundColor: AppColors.whiteBackgroundColor,
                placeholder: 'Search Coin Pairs',
                placeholderStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      );
}
