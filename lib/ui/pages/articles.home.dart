import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news/blocs/bloc.top.headlines.dart';
import 'package:hacker_news/models/article/models.article.dart';
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';
import 'package:hacker_news/ui/widgets/widget.category.feeds.dart';
import 'package:hacker_news/ui/widgets/widget.hero.topnews.dart';
import 'package:hacker_news/ui/widgets/widgets.category.sources.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final PageController carousalController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        if (currentPage < 10) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        carousalController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceOut);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TRENDING",
                  style: GoogleFonts.nunitoSans(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  )),
              SizedBox(
                  height: size.height * .51,
                  width: double.infinity,
                  child:TopHeadLines(carousalController: carousalController,)),
              Text("Top Category",
                  style: GoogleFonts.nunitoSans(
                    color: Constants.darkColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  height: size.height * .16,
                child:const TopCategory()
              ),
              const CategoryFeeds()

            ],
          )),
    );
  }


}
