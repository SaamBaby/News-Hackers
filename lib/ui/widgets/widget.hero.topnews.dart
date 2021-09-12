import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news/blocs/bloc.top.headlines.dart';
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';
import 'package:timeago/timeago.dart' as timeago;
class TopHeadLines extends StatelessWidget {
  final PageController carousalController;
  const TopHeadLines({Key? key, required this.carousalController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
        stream: topHeadLinesBloc.topHeadLines,
        builder: (BuildContext context,
            AsyncSnapshot<ArticleResponse> snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.active) {
            if (snapshot.data!.error.isEmpty) {
              return PageView(
                scrollDirection: Axis.horizontal,
                controller: carousalController,
                children: snapshot.data!.articles
                    .map((e) =>  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Text(e.title.toString(),
                                    style: GoogleFonts.nunitoSans(
                                      color: Constants.darkColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                    ))),

                            Text("Published ${timeago.format(DateTime.parse(e.publishedAt.toString()))}",
                                style: GoogleFonts.nunitoSans(
                                  color: Constants.primaryColor.withOpacity(.3),
                                  height: 2.5,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    e.urlToImage.toString(),
                                  ),
                                ))
                          ],
                        ))))
                    .toList(),
              );
            } else {
              return const Center(
                  child: Text("Error while getting the data"));
            }
          } else {
            return const Center(
                child: CircularProgressIndicator());
          }
        });
  }
}
