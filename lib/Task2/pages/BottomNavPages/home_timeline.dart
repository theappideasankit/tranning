import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_all_post.dart';
import 'package:day1/Task2/pages/BottomNavPages/comment_page.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeTimeLine extends StatefulWidget {
  const HomeTimeLine({Key key}) : super(key: key);

  @override
  _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
  Widget _buildPost(int index) {
    return FutureBuilder<GetAllPost>(
      future: GetAllPostApi.getAllPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 560.0,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: const CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                    height: 50.0,
                                    width: 50.0,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000")),
                              ),
                            ),
                          ),
                          title:
                              "${snapshot.data.data[index].userInfo.username}"
                                  .text
                                  .make(),
                          subtitle: "subtitle".text.make(),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz),
                            color: Colors.black,
                            onPressed: () => print("More"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => print("liked Post"),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (cntext)=> ViewPostPAge());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.black45,
                            blurRadius: 8.0,
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              iconSize: 20.0,
                              onPressed: () => print("like post"),
                            ),
                            "2,250".text.fontWeight(FontWeight.w600).make(),
                            10.widthBox,
                            IconButton(
                              onPressed: () => print("ViewPost"),
                              icon: const Icon(Icons.chat),
                              iconSize: 20.0,
                            ),
                            "2500".text.fontWeight(FontWeight.w600).make(),
                          ],
                        ),
                        20.widthBox,
                        Divider(),
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () => print("save post"),
                              icon: const Icon(Icons.bookmark_border),
                              iconSize: 25.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _refreshProducts(BuildContext context) async {
    var refresh;
    setState(() {
      refresh = GetAllPostApi.getAllPost();
    });
    return refresh;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            "FitNow".text.xl3.make(),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () => print('notification'),
              ),
              IconButton(
                  onPressed: () => print("add post"),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
      backgroundColor: Colors.black45,
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: FutureBuilder<GetAllPost>(
          future: GetAllPostApi.getAllPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const Divider(
                          thickness: 0.9,
                        ),
                        /* Container(
                          width: double.infinity,
                          height: 100.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return 10.widthBox;
                              }
                              return Container(
                                margin: const EdgeInsets.all(10.0),
                                width: 60.0,
                                height: 60.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.black45,
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: ClipOval(
                                    child: Image(
                                        height: 60.0,
                                        width: 60.0,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP825/macbookair.png")),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),*/
                        const Divider(
                          thickness: 0.9,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Container(
                            width: double.infinity,
                            height: 560.0,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6.0,
                                                ),
                                              ]),
                                          child: CircleAvatar(
                                            child: ClipOval(
                                              child: Image(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      Constants.urlImage +
                                                          snapshot
                                                              .data
                                                              .data[index]
                                                              .userInfo
                                                              .profile
                                                              .toString())),
                                            ),
                                          ),
                                        ),
                                        title: snapshot.data.data[index]
                                            .userInfo.username.text
                                            .make(),
                                        subtitle: "subtitle".text.make(),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.more_horiz),
                                          color: Colors.black,
                                          onPressed: () => print("More"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onDoubleTap: () => print("liked Post"),
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (cntext)=> ViewPostPAge());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          color: Colors.black45,
                                          blurRadius: 8.0,
                                        ),
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(Constants.urlImage +
                                            snapshot.data.data[index].image),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(
                                                Icons.favorite_border),
                                            iconSize: 20.0,
                                            onPressed: () => print("like post"),
                                          ),
                                          snapshot.data.data[index].likeInfo
                                              .length.text
                                              .fontWeight(FontWeight.w600)
                                              .make(),
                                          10.widthBox,
                                          IconButton(
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CommentPage(index))),
                                            icon: const Icon(
                                                Icons.comment_bank_outlined),
                                            iconSize: 20.0,
                                          ),
                                          snapshot.data.data[index].commentInfo
                                              .length.text
                                              .fontWeight(FontWeight.w600)
                                              .make(),
                                        ],
                                      ),
                                      20.widthBox,
                                      const Divider(),
                                      IconButton(
                                        onPressed: () => print("save post"),
                                        icon: const Icon(Icons.bookmark_border),
                                        iconSize: 25.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
