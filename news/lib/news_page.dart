import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/colors.dart';

import 'package:news/homePage.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _pageIndex = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  late PageController _pageController;
  final List<Widget> navItems = [
    const Icon(
      Icons.home,
      color: Colors.white,
      size: 24,
    ),
    const Icon(
      Icons.search,
      color: Colors.white,
      size: 24,
    ),
    const Icon(
      Icons.bookmark_border_outlined,
      color: Colors.white,
      size: 24,
    ),
    ClipOval(
      child: Image.asset(
        'assets/images/person.png',
        fit: BoxFit.cover,
      ),
    )
  ];
  final List<String> _navLabels = ["Home", "Search", "Save", "Account"];

  double _getLabelPosition() {
    final double itemWidth =
        MediaQuery.sizeOf(context).width / _navLabels.length;
    final double position = (_pageIndex * itemWidth) + (itemWidth / 2) - 20;
    return position;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColo,
      bottomNavigationBar: Stack(
        children: [
          CurvedNavigationBar(
            key: _bottomNavigationKey,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColors.buttonNavColor,
            color: AppColors.navColor,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.decelerate,
            items: navItems,
            onTap: (value) {
              setState(() {
                _pageIndex = value;
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_pageController.hasClients) {
                  _pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              });
              _pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
          ),
          Positioned(
            bottom: 2,
            left: _getLabelPosition(),
            child: Text(
              _navLabels[_pageIndex],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        // onPageChanged: (value) {
        //   setState(() {
        //     _pageIndex = value;
        //   });
        // },
        children: const [
          HomePage(),
          //!! put the other pages here
          Center(
            child: Text('search'),
          ),
          Center(
            child: Text('save'),
          ),
          Center(
            child: Text('account'),
          ),
        ],
      ),
    );
  }
}
