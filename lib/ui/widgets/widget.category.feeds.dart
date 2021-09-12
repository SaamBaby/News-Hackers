import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news/blocs/bloc.source.news.dart';
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/ui/pages/articles.news.details.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class CategoryFeeds extends StatelessWidget {
  const CategoryFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
        stream: sourcesNewsBloc.sourceFeeds,
        builder:
            (BuildContext context, AsyncSnapshot<ArticleResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.error.isEmpty) {
              return buildCategories(context, snapshot.data!);
            } else {
              print(snapshot.data!.error);
              return const Center(child: Text("Error while getting the news"));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
    ;
  }

  ListView buildCategories(BuildContext context, ArticleResponse e) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: e.articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)
              => NewsDetails(article: e.articles[index],)));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(bottom: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                  flex: 1,
                  child: Hero(
                    tag: e.articles[index].title.toString(),
                    child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image: e.articles[index].urlToImage.toString(),
                          ),
                        )),
                  ),
                ),
                  Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(e.articles[index].title.toString(),
                          style: GoogleFonts.nunitoSans(
                            color: Constants.darkColor.withOpacity(.9),
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )),
                      const SizedBox(height: 5),
                      Text(
                          timeago.format(DateTime.parse(
                              e.articles[index].publishedAt.toString())),
                          style: GoogleFonts.nunitoSans(
                            color: Constants.darkColor.withOpacity(.3),
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          )),
                      Text("By ${e.articles[index].author.toString()}",
                          style: GoogleFonts.nunitoSans(
                            color: Constants.darkColor.withOpacity(.3),
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          )),
                    ],
                  ),
                )
              ]),
            ),
          );
        });
  }
}
