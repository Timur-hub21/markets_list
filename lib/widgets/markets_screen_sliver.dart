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
  final TextEditingController searchController = TextEditingController();

  late TabController tabController;

  /// Tab first item selection
  bool isFirstItemSelected = true;

  /// Tab second item selection
  bool isSecondItemSelected = false;

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

  /// Toggle currency to favorite
  void toggleFavoritesStatus(CurrencyModel currency) {
    setState(() {
      currency.isFavorite = !currency.isFavorite;
    });

    if (currency.isFavorite) {
      favoritesList.add(currency);
    } else {
      favoritesList.remove(currency);
    }
  }

  /// Search by markets list
  List<CurrencyModel> searchByMarketsList(String request) {
    request = request.toLowerCase();
    return marketsList
        .where((currency) =>
            currency.currencyName.toLowerCase().contains(request) ||
            currency.tag.toLowerCase().contains(request))
        .toList();
  }

  /// Search by favorites list
  List<CurrencyModel> searchByFavoritesList(String request) {
    request = request.toLowerCase();
    return favoritesList
        .where((currency) =>
            currency.currencyName.toLowerCase().contains(request) ||
            currency.tag.toLowerCase().contains(request))
        .toList();
  }

  /// Search callback for textfield
  void onSearchTextChanged(String text) {
    setState(() {
      if (text.isEmpty) {
        filteredMarketsList = List.from(marketsList);
        filteredFavoritesList = List.from(favoritesList);
      } else {
        filteredMarketsList = searchByMarketsList(text);
        filteredFavoritesList = searchByFavoritesList(text);
      }
    });
  }

  /// Display default or filtered markets list
  List<CurrencyModel> getDisplayedMarketsList() {
    return searchController.text.isEmpty ? marketsList : filteredMarketsList;
  }

  /// Display default or filtered favorites list
  List<CurrencyModel> getDisplayedFavoritesList() {
    return searchController.text.isEmpty ? favoritesList : filteredFavoritesList;
  }

  List<CurrencyModel> marketsList = <CurrencyModel>[
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

  /// Favorite currencies list
  List<CurrencyModel> favoritesList = [];

  /// Filtered markets list
  List<CurrencyModel> filteredMarketsList = [];

  /// Filtered favorites list
  List<CurrencyModel> filteredFavoritesList = [];

  @override
  Widget build(BuildContext context) => CustomScrollView(
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
                      onChanged: (String text) => onSearchTextChanged(text),
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
                        labelColor: isFirstItemSelected || isSecondItemSelected
                            ? AppColors.blueBackgroundColor
                            : AppColors.whiteBackgroundColor,
                        unselectedLabelColor: isFirstItemSelected || isSecondItemSelected
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
                            onTap: () {
                              setState(() {
                                isFirstItemSelected = true;
                                isSecondItemSelected = false;
                                tabController.index = 0;
                              });
                            },
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
                            onTap: () {
                              setState(() {
                                isFirstItemSelected = false;
                                isSecondItemSelected = true;
                                tabController.index = 1;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: isSecondItemSelected
                                    ? AppColors.whiteBackgroundColor
                                    : Colors.transparent,
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
          tabController.index == 0
              ? DecoratedSliver(
                  decoration: const BoxDecoration(
                    color: AppColors.whiteBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  sliver: SliverList.separated(
                    itemCount: getDisplayedMarketsList().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: CustomTile(
                          title: getDisplayedMarketsList()[index].tag,
                          price: getDisplayedMarketsList()[index].price,
                          svgIcon: getDisplayedMarketsList()[index].svgIcon,
                          percent: getDisplayedMarketsList()[index].percent,
                          isPostitive: getDisplayedMarketsList()[index].isPercentPositive,
                          isFavorite: getDisplayedMarketsList()[index].isFavorite,
                          onTap: () => toggleFavoritesStatus(getDisplayedMarketsList()[index]),
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
                )
              : getDisplayedFavoritesList().isNotEmpty
                  ? DecoratedSliver(
                      decoration: const BoxDecoration(
                        color: AppColors.whiteBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      sliver: SliverList.separated(
                        itemCount: getDisplayedFavoritesList().length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: CustomTile(
                              title: getDisplayedFavoritesList()[index].tag,
                              price: getDisplayedFavoritesList()[index].price,
                              svgIcon: getDisplayedFavoritesList()[index].svgIcon,
                              percent: getDisplayedFavoritesList()[index].percent,
                              isPostitive: getDisplayedFavoritesList()[index].isPercentPositive,
                              isFavorite: getDisplayedFavoritesList()[index].isFavorite,
                              onTap: () =>
                                  toggleFavoritesStatus(getDisplayedFavoritesList()[index]),
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
                    )
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Favorites list is empty, add currencies on previous tab',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.whiteBackgroundColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
        ],
      );
}
