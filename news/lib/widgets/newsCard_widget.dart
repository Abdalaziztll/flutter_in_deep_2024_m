import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/model.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
    required this.newsList,
    required this.index,
  });

  final List<LatestNewsModel> newsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(5),
      height: 85,
      width: 341,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    newsList[index].news,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      newsList[index].resourse,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: AppColors.navColor,
                      ),
                    ),
                    Text(
                      '. ${newsList[index].publishedIn}',
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightTextColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Image.asset(
              newsList[index].image,
              width: 85,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
