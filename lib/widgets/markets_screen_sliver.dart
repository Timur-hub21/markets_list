import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';

class MarketsScreenSliver extends StatefulWidget {
  const MarketsScreenSliver({super.key});

  @override
  State<MarketsScreenSliver> createState() => _MarketsScreenSliverState();
}

class _MarketsScreenSliverState extends State<MarketsScreenSliver>
    with SingleTickerProviderStateMixin {
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

  final ScrollController _scrollController = ScrollController();

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
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Элемент $index'),
                  subtitle: Text('Подзаголовок $index'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ),
        ],
      );
}
