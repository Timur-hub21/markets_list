import 'package:flutter/material.dart';

final class CurrencyModel {
  final String currencyName;
  final String tag;
  final String price;
  final Widget svgIcon;
  final Widget chart;
  final bool isFavorite;

  CurrencyModel({
    required this.currencyName,
    required this.tag,
    required this.price,
    required this.svgIcon,
    required this.chart,
    required this.isFavorite,
  });
}
