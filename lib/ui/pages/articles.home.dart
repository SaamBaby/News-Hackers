import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hackers_news/blocs/blocs.articles.dart';
import 'package:hackers_news/models/article/models.article.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const.topStories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hacker News"),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
              stream: articleBloc.article,
              builder: (BuildContext context,  AsyncSnapshot<UnmodifiableListView<Article>> snapshot) {
                if(snapshot.connectionState==ConnectionState.active){
                 if(snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.map((e) => buildTile(e))
                          .toList(),
                    );
                  }else{
                   return const Center(child: Text("Error while getting the data"));
                 }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
      );
  }

  Widget buildTile(Article? article) {
    return Padding(
        key: Key((article!.title.toString())),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ExpansionTile(
          title: Text((article.title.toString())),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(article.type.toString()),
                IconButton(
                  onPressed: () async {
                    if (await canLaunch(article.url.toString())) {
                      await launch(
                        article.url.toString(),
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{
                          'my_header_key': 'my_header_value'
                        },
                      );
                    } else {
                      throw 'Could not launch ${article.url}';
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            )
          ],
        ));
  }
}
