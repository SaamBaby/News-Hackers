import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacker_news/blocs/bloc.source.news.dart';
import 'package:hacker_news/blocs/bloc.sources.dart';
import 'package:hacker_news/models/source/response/models.source.response.dart';
import 'package:hacker_news/ui/utils/utils.constants.dart';


class TopCategory extends StatelessWidget {

  const TopCategory({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
        stream: sourcesBloc.sources,
        builder:
            (BuildContext context, AsyncSnapshot<SourceResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.error.isEmpty) {
              return buildCategories(context, snapshot.data!);
            } else {
              print(snapshot.data!
                  .error);
              return  const Center(
                  child: Text("Error while getting the news"));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
    ;
  }

  SizedBox buildCategories(BuildContext context, SourceResponse e) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: e.sources.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                sourcesNewsBloc.fetchSourceNews(id: e.sources[index].id!);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children:[
                      Hero(tag: e.sources[index].id.toString(), child: Container(
                        width:50,
                        height: 50,
                        decoration: BoxDecoration(
                           color: const Color(0xfff9f9f9),
                           borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                             fit: BoxFit.contain,
                              image: AssetImage('assets/logos/${e.sources[index].id}.png')

                          )
                        ),
                      ),

                      ),
                      const SizedBox(height: 5,),
                      Text(e.sources[index].name.toString(),
                          maxLines: 2,
                          style: GoogleFonts.nunitoSans(
                            color: Constants.darkColor.withOpacity(.9),
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )),
                      Text(e.sources[index].category.toString(),
                          style: GoogleFonts.nunitoSans(
                            color: Constants.darkColor.withOpacity(.3),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          )),
                    ]
                  ),
                ),
              );
            }
        ));
  }
}
