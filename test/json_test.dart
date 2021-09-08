import 'package:flutter_test/flutter_test.dart';
import 'package:hackers_news/models/article/models.article.dart';
import 'package:http/http.dart' as http;

void main() {
  test("article parsing", () {
    const jsonStr= """{
          "by" : "dhouston",
          "descendants" : 71,
          "id" : 8863,
          "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
          "score" : 111,
          "time" : 1175714200,
          "title" : "My YC app: Dropbox - Throw away your USB drive",
          "type" : "story",
          "url" : "http://www.getdropbox.com/u/2/screencast.html"
        }""";
    //
    expect(parseArticle(jsonStr).by, "dhouston");
  });

  test("http get and parsing", ()async {
    const  postUrl = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
    final  response =await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
     final listOfIds= parseTopStories(response.body);
     if(listOfIds.isNotEmpty){
       final  postUrl = "https://hacker-news.firebaseio.com/v0/item/${listOfIds.first}.json?print=pretty";
       final  response =await http.get(Uri.parse(postUrl));
       if (response.statusCode == 200) {
         expect(parseArticle(response.body).id, 28440742)  ;
       }

     }
    }
  });
}


