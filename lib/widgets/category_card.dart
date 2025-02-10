import 'package:flutter/material.dart';
import 'package:news_app/model/categoryModel.dart';
import 'package:news_app/screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryScreen(categoryName: category.categoryText,)));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.cover,
                opacity: 0.4),
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)),
        height: 110,
        width: 190,
        child: Center(
            child: Text(
          category.categoryText,
          style: const TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
