import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets_list/components/custom_tile.dart';
import 'package:markets_list/constants/app_colors.dart';
import 'package:markets_list/constants/app_icons.dart';
import 'package:markets_list/models/currency_model.dart';

class MarketsScreenSliver extends StatefulWidget {
  const MarketsScreenSliver({super.key});

  @override
  State<MarketsScreenSliver> createState() => _MarketsScreenSliverState();
}

class _MarketsScreenSliverState extends State<MarketsScreenSliver>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  late TabController tabController;

  bool isFirstItemSelected = true;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<CurrencyModel> marketsList = <CurrencyModel>[
    CurrencyModel(
      currencyName: 'Tether',
      tag: 'Usdt',
      price: '0.92761',
      svgIcon: AppIcons.tetherIcon,
      percent: '0.78',
      isPercentPositive: false,
    ),
    CurrencyModel(
      currencyName: 'Bitcoin',
      tag: 'Btc',
      price: '27448.70',
      svgIcon: AppIcons.bitcoinIcon,
      percent: '0.91',
      isPercentPositive: false,
    ),
    CurrencyModel(
      currencyName: 'Ethereum',
      tag: 'Eth',
      price: '0.92761',
      svgIcon: AppIcons.ethereum,
      percent: '5.22',
      isPercentPositive: true,
    ),
    CurrencyModel(
      currencyName: 'S&P500',
      tag: 'Gspc',
      price: '125.4',
      svgIcon: AppIcons.sp1,
      percent: '3.11',
      isPercentPositive: true,
    ),
    CurrencyModel(
      currencyName: 'Apple',
      tag: 'Aapl',
      price: '1021.40',
      svgIcon: AppIcons.appleIcon,
      percent: '0.17',
      isPercentPositive: false,
    ),
    CurrencyModel(
      currencyName: 'Solana',
      tag: 'Sol',
      price: '102.58',
      svgIcon: AppIcons.ethereum,
      percent: '0.64',
      isPercentPositive: true,
    ),
    CurrencyModel(
      currencyName: 'Usdc',
      tag: 'Usdc',
      price: '1.00',
      svgIcon: AppIcons.tetherIcon,
      percent: '0.17',
      isPercentPositive: true,
    ),
    CurrencyModel(
      currencyName: 'Cardano',
      tag: 'Ada',
      price: '0.59',
      svgIcon: AppIcons.tetherIcon,
      percent: '0.86',
      isPercentPositive: true,
    ),
    CurrencyModel(
      currencyName: 'Avalanche',
      tag: 'Avax',
      price: '36.41',
      svgIcon: AppIcons.bitcoinIcon,
      percent: '0.07',
      isPercentPositive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 100,
            pinned: true,
            backgroundColor: AppColors.blueBackgroundColor,
            flexibleSpace: SingleChildScrollView(
              child: Padding(
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
                      controller: searchController,
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
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  SizedBox(
                    height: 45,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: AppColors.whiteBackgroundColor),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TabBar(
                        labelColor: isFirstItemSelected
                            ? AppColors.blueBackgroundColor
                            : AppColors.whiteBackgroundColor,
                        unselectedLabelColor: isFirstItemSelected
                            ? AppColors.whiteBackgroundColor
                            : AppColors.blueBackgroundColor,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        controller: tabController,
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                        ),
                        tabs: [
                          InkWell(
                            onTap: () => setState(() => isFirstItemSelected = true),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: isFirstItemSelected
                                    ? AppColors.whiteBackgroundColor
                                    : Colors.transparent,
                              ),
                              child: const Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.trending_up),
                                    SizedBox(width: 5),
                                    Text('All'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() => isFirstItemSelected = false),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: isFirstItemSelected
                                    ? Colors.transparent
                                    : AppColors.whiteBackgroundColor,
                              ),
                              child: const Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.star_border),
                                    SizedBox(width: 5),
                                    Text('Favorites'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          DecoratedSliver(
            decoration: const BoxDecoration(
              color: AppColors.whiteBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            sliver: SliverList.separated(
              itemCount: marketsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: CustomTile(
                    title: marketsList[index].tag,
                    price: marketsList[index].price,
                    svgIcon: marketsList[index].svgIcon,
                    percent: marketsList[index].percent,
                    isPostitive: marketsList[index].isPercentPositive,
                    isFavorite: marketsList[index].isFavorite,
                    onTap: () {
                      setState(() {
                        marketsList[index].isFavorite = !marketsList[index].isFavorite;
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(thickness: 1.5),
                );
              },
            ),
          ),
        ],
      );
}
