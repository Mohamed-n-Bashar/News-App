// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/widgets/NewsTile.dart';

class NewsListView extends StatelessWidget {
  List<ArticleModel> articles;
  NewsListView({super.key,required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: articles.length,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Newstile(articleModel: articles[index],),
        );
      },
    ));
  }
}
