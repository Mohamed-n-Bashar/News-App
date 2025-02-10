// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:news_app/model/categoryModel.dart';
import 'category_card.dart';

class categories_listview extends StatelessWidget {
  const categories_listview({super.key,});

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.webp', categoryText: 'Business'),
    CategoryModel(image: 'assets/entertainment.png', categoryText: 'Entertainment'),
    CategoryModel(image: 'assets/health.jpg', categoryText: 'health'),
    CategoryModel(image: 'assets/science.jpg', categoryText: 'Science'),
    CategoryModel(image: 'assets/technology.jpg', categoryText: 'Technology'),
    CategoryModel(image: 'assets/sports.jpg', categoryText: 'Sports'),
    CategoryModel(image: 'assets/news.jpeg', categoryText: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context , i){
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CategoryCard(
              category: categories[i],),
          );
        }),
    );
  }
}