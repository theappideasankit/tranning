import 'package:day1/App2/model/newsModel.dart';
import 'package:day1/App2/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = ApiManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "API Integration".text.make(),
      ),
      body: Container(
          padding: Vx.m24,
          child: FutureBuilder<NewsModel>(
            future: _newsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data.articles[index];
                      // ignore: unused_local_variable
                      var timeDate = DateFormat('dd MMM - HH:mm')
                          .format(article.publishedAt);
                      return SizedBox(
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(article.urlToImage),
                              ),
                            ),
                            10.widthBox,
                            Flexible(
                              child: Column(
                                children: [
                                  article.title.text.xl.bold
                                      .overflow(TextOverflow.ellipsis)
                                      .make(),
                                  article.description.text
                                      .maxLines(2)
                                      .overflow(TextOverflow.ellipsis)
                                      .make(),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      timeDate.text
                                          .color(Colors.grey)
                                          .end
                                          .make()
                                          .expand()
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return const CircularProgressIndicator().centered().expand();
              }
            },
          )),
    );
  }
}
