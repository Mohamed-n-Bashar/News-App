// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/services/newsService.dart';
import 'package:news_app/widgets/News_List_View.dart';
import 'package:news_app/widgets/Oops.dart';

class NewsListView_FutureBuilder extends StatefulWidget {
  const NewsListView_FutureBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListView_FutureBuilder> createState() => _NewsListView_FutureBuilderState();
}

class _NewsListView_FutureBuilderState extends State<NewsListView_FutureBuilder> {
  
  late Future<List<ArticleModel>> future;
  @override
  void initState() {
    super.initState();
    future = Newsservice().getNews(category: widget.category);
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data ?? []);
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(child: Oops());
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,                                // لتجنب التمرير إذا كان المحتوى أقل من الشاشة
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
