import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news/models/article/models.article.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';
import 'package:intl/intl.dart';

class NewsDetails extends StatelessWidget {
  final Article article;

  const NewsDetails({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(.8)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title.toString(),
              style: GoogleFonts.nunitoSans(
                color: Constants.darkColor,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "Published: ${DateFormat.yMMMd().format(DateTime.parse(article.publishedAt.toString()))} by",
                      style: GoogleFonts.nunitoSans(
                        color: Constants.darkColor.withOpacity(.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      )),
                  TextSpan(
                      text: " ${article.author}",
                      style: GoogleFonts.nunitoSans(
                        color: Constants.darkColor.withOpacity(.8),
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      )),
                ],
              ),
            ),
            Text(
              article.description.toString(),
              style: GoogleFonts.nunitoSans(
                color: Constants.darkColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Hero(
              tag: article.title.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
              article.urlToImage.toString(),
              height: size.height * .25,
              width: size.width,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Text(
              article.content!.split('[').first.toString(),
              style: GoogleFonts.nunitoSans(
                color: Constants.darkColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
