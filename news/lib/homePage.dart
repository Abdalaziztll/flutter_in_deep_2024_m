import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/images.dart';
import 'package:news/model.dart';
import 'package:news/widgets/homeAppBar_widget.dart';
import 'package:news/widgets/images_widget.dart';
import 'package:news/widgets/newsCard_widget.dart';
import 'package:news/widgets/newsType_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool seeMore = false;
  late PageController _pageController;
  int selectedIndex = 0;

  NewsCategories allNews = NewsCategories(
    latestNewsModel: [
      LatestNewsModel(
        news:
            'Maharastra Board Result 2024 Live: Check updates on Maha SSC,HSC result dates',
        resourse: 'Education',
        publishedIn: 'Published 47mins ago',
        image: 'assets/images/news1.png',
      ),
      LatestNewsModel(
        news:
            'Indian-American entrepreneur Pritika Mehta shares tips for immigrant founders in San Francisco',
        resourse: 'World News',
        publishedIn: 'Published 24mins ago',
        image: 'assets/images/news2.png',
      ),
      LatestNewsModel(
        news: "Narendra Modi files nomination fromVaranasi | Watch",
        resourse: 'Election News',
        publishedIn: 'Published 47mins ago',
        image: 'assets/images/news3.png',
      ),
    ],
    images: imagesPath,
  );

  NewsCategories politicsNews = NewsCategories(
    latestNewsModel: [
      LatestNewsModel(
        news:
            'Indian-American entrepreneur Pritika Mehta shares tips for immigrant founders in San Francisco',
        resourse: 'World News',
        publishedIn: 'Published 24mins ago',
        image: 'assets/images/news2.png',
      ),
      LatestNewsModel(
        news: "Narendra Modi files nomination fromVaranasi | Watch",
        resourse: 'Election News',
        publishedIn: 'Published 47mins ago',
        image: 'assets/images/news3.png',
      ),
    ],
    images: imagesPath2,
  );
  void onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            NewsTypeWidget(
              selectedIndex: selectedIndex,
              onTap: onCategoryTap,
            ),
            Expanded(
                child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                buildCategoryContant(allNews),
                buildCategoryContant(politicsNews),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildCategoryContant(NewsCategories newsList) {
    return Column(
      children: [
        ImagesWidget(
          images: newsList.images,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest News',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    seeMore = !seeMore;
                  });
                },
                child: const Center(
                  child: Text(
                    'See More',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: seeMore
              ? ListView.builder(
                  itemCount: newsList.latestNewsModel.length,
                  itemBuilder: (context, index) {
                    return NewsCardWidget(
                        index: index, newsList: newsList.latestNewsModel);
                  },
                )
              : Container(),
        ),
      ],
    );
  }
}
