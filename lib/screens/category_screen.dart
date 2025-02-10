import 'package:flutter/material.dart';
import 'package:news_app/widgets/News_List_View_FutureBuilder.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(categoryName,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20,)),
            NewsListView_FutureBuilder(category: categoryName)
          ],
        ),
      ),
    );
  }
}