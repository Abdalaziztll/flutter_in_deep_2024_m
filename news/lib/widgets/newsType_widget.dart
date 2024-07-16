import 'package:flutter/material.dart';
import 'package:news/colors.dart';

class NewsTypeWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const NewsTypeWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Politics',
      'Sports',
      'Health',
      'Tech',
    ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(categories.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Text(
              categories[index],
              style: TextStyle(
                color:
                    isSelected ? AppColors.navColor : AppColors.lightTextColor,
                fontSize: isSelected ? 20 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );
  }
}
