import 'package:flutter/material.dart';
import 'package:news/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: AppColors.navColor,
            size: 24,
          ),
          Text(
            'Grand News',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.notifications,
            color: AppColors.navColor,
            size: 24,
          )
        ],
      ),
    );
  }
}
