import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/screens/news_content.dart';

class Newstile extends StatelessWidget {
  const Newstile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsContent(newsContent: articleModel.url??'',)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: articleModel.image != null 
            ? SizedBox(height: 200,width: double.infinity, child: Image.network(articleModel.image!,fit: BoxFit.cover, height: 200,width: double.infinity,loadingBuilder: (context, child, loadingProgress){
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator(value: loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes!,));
            }))
            : Image.asset('assets/empty.jpg')
          ),
          const SizedBox(height: 12,),
          Text(articleModel.title??'لا يوجد عنوان لهذا المقال',
            style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 21),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // textDirection: TextDirection.rtl,
            ),
      
          Text(articleModel.subtitle??'',
            style: TextStyle(color: Colors.grey[600] , fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // textDirection: TextDirection.rtl,
            )
        ],
      ),
    );
  }
}