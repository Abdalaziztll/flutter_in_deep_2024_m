import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';


class ImagesWidget extends StatelessWidget {
  final List<String> images;
  const ImagesWidget({
    super.key, required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Swiper(
        axisDirection: AxisDirection.right,
        itemWidth: 249,
        itemHeight: 338,
        itemCount: images.length,
        layout: SwiperLayout.STACK,
        loop: true,
        duration: 1200,
        itemBuilder: (context, index) => Container(
          width: 249,
          height: 338,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
