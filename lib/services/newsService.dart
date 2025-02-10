import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/services/constants.dart';

class Newsservice {
  final Dio dio = Dio();
  // Newsservice(this.dio);                                           // كان ممكن اديله القيمة مره واحده ولكن ثروت سامي بيحب انه يباصي القيم دي

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response<dynamic> response = await dio.get('$baseUrl$endPoint$query$category');

      Map<String, dynamic> jsonData = response.data;                  // convert data to Map
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlesList =[];                            // convert from ( List<Map> ) to ( List<object> )

      for (var articles in articles) {
        ArticleModel articlesObject = ArticleModel.fromjson(articles);
        articlesList.add(articlesObject);
      }
      return articlesList;

    } on DioException catch (e) {
      final String errorMessage = e.response?.data['message']         // علشان يجيبلي رسالة الايرور اللي في ال api
      ?? 'Oops there was an error, try later';                        // دي علشان لو اتبعت null مش رسالة الايرور اللي في ال api
      throw Exception(errorMessage);
      
    } catch (e){                                                      // علشان لو حصل مشكلة غير اللي في ال dio
      log(e.toString());                                              // علشان يطبعلي الرساله هنا وافهمها بسرعه
      throw Exception('Oops there was an error, try later');    
    }
  }
}
