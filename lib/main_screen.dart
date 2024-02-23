import 'package:flutter/material.dart';
import 'package:markets_list/constants/app_colors.dart';
import 'package:markets_list/screens/account_screen.dart';
import 'package:markets_list/screens/markets_screen.dart';
import 'package:markets_list/screens/portfolio_screen.dart';
import 'package:markets_list/screens/trade_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentScreen = 0;

  final List<Widget> screens = const <Widget>[
    MarketsScreen(),
    TradeScreen(),
    PortfolioScreen(),
    AccountScreen(),
  ];

  void changeScreen(int index) => setState(() => currentScreen = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
        ),
        height: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentScreen,
          onTap: (index) => changeScreen(index),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: AppColors.blueBackgroundColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up, size: 20),
              label: 'Markets',
              activeIcon: Icon(Icons.trending_up, size: 20, color: AppColors.blueBackgroundColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_circle_outlined, size: 20),
              label: 'Trade',
              activeIcon: Icon(Icons.change_circle_outlined,
                  size: 20, color: AppColors.blueBackgroundColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, size: 20),
              label: 'Portfolio',
              activeIcon: Icon(Icons.wallet, size: 20, color: AppColors.blueBackgroundColor),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 20),
              label: 'Account',
              activeIcon:
                  Icon(Icons.account_circle, size: 20, color: AppColors.blueBackgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
