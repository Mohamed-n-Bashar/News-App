import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/services/newsService.dart';
import 'package:news_app/widgets/News_List_View.dart';
import 'package:news_app/widgets/Oops.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category
  });

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isloading = true ;

  @override
  void initState(){
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    articles = await Newsservice().getNews(category: widget.category );
    isloading = false ;
    setState(() {});                                      // to rebuild Ui after fetch data
  }

  @override
  Widget build(BuildContext context) {
    return isloading 
    ? const SliverFillRemaining(
      hasScrollBody: false,                               // لتجنب التمرير إذا كان المحتوى أقل من الشاشة 
      child: Center(
        child: CircularProgressIndicator()
      ),
    )
    : articles.isEmpty 
    ? const SliverFillRemaining(child: Oops())
    : NewsListView(articles: articles,);
  }
}
