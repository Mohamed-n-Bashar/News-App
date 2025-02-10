class ArticleModel {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? url;

  ArticleModel(                                         // constructor
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.url});

  factory ArticleModel.fromjson(articles) {             // named constructor
    return ArticleModel(
        image: articles["urlToImage"],
        title: articles["title"],
        subtitle: articles["description"],
        url: articles["url"]);
  }
}
