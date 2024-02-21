import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppIcons.blueBackgroundColor,
        ),
      );
}
