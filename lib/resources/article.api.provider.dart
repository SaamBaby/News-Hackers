import 'package:hackers_news/models/article/models.article.dart';
import 'package:http/http.dart' as http;
class ArticleApiProvider{

  Future<Article> getArticle (int id) async {
    final  postUrl = "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty";
    final  response =await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      print(response);
      return  parseArticle(response.body);
    } else {
      return throw  'error';
    }
  }
  Future<List<int>> getAllTopStories () async {
    const  postUrl = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
    final  response =await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      return  parseTopStories(response.body);
    } else {
      return throw  'error';
    }
  }
}