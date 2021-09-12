import 'package:flutter/material.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';

import 'articles.home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
   int _currentIndex = 0;
  PageController? _pageController;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (i)=>setState(() {
            _currentIndex=i;
          }),
          children: <Widget> [
            const Home(),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        enableFeedback: true,
        onTap: (i){
          setState(() {
           _currentIndex=i;
          });
        },
        mouseCursor: MouseCursor.uncontrolled,
        type:BottomNavigationBarType.fixed,
        iconSize: 25,
        elevation: 5,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor:Constants.primaryColor,
        unselectedItemColor: Colors.black,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
