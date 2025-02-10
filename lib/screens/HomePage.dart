import 'package:flutter/material.dart';
// import 'package:news_app/widgets/News_List_View_Builder.dart';            // the first solution
import 'package:news_app/widgets/News_List_View_FutureBuilder.dart';      // the new & creative solution
import 'package:news_app/widgets/categories_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('News',style: TextStyle(fontSize: 30, color: Colors.black)),
              Text('Cloud',style: TextStyle(fontSize: 30, color: Colors.orange,fontWeight: FontWeight.bold)),
          ],),
          centerTitle: true,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: categories_listview()),
            SliverToBoxAdapter(child: SizedBox(height: 25,)),
            NewsListView_FutureBuilder(category: 'general',)                          // you can use ( NewsListViewBuilder ) but ( NewsListView_FutureBuilder ) is better
        ],),
      )
    );
  }
}