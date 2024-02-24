// import 'package:flutter/material.dart';

final class CurrencyModel {
  final String currencyName;
  final String tag;
  final String price;
  final String svgIcon;
  // final Widget chart;
  bool isFavorite;
  final String percent;
  final bool isPercentPositive;

  CurrencyModel({
    required this.currencyName,
    required this.tag,
    required this.price,
    required this.svgIcon,
    // required this.chart,
    this.isFavorite = false,
    required this.percent,
    required this.isPercentPositive,
  });
}
