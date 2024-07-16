class LatestNewsModel {
  String news;
  String resourse;
  String publishedIn;
  String image;
  LatestNewsModel({
    required this.news,
    required this.resourse,
    required this.publishedIn,
    required this.image,
  });
}

class NewsCategories {
  List<LatestNewsModel> latestNewsModel;
  List<String> images;
  NewsCategories({
    required this.latestNewsModel,
    required this.images,
  });
}
