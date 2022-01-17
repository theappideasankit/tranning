import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/customWidgets/HeartAnimationWidget.dart';
import 'package:day1/Task2/customWidgets/videoViews.dart';
import 'package:day1/Task2/model/get_all_trainer_model.dart';
import 'package:day1/Task2/pages/BottomNavPages/comment_page.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_trainer.dart';
import 'package:day1/Task2/service/get_TrainerApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class TrainerTimeLine extends StatefulWidget {
  const TrainerTimeLine({Key key}) : super(key: key);

  @override
  _TrainerTimeLineState createState() => _TrainerTimeLineState();
}

class _TrainerTimeLineState extends State<TrainerTimeLine> {
  bool isSaved = false;
  int index2;
  GetAllTrainerApi controller;

  Future<void> _refreshProducts(BuildContext context) async {
    var refresh;
    setState(() {
      refresh = controller.getAllTainer();
    });
    return refresh;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = GetAllTrainerApi();
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
        child: FutureBuilder<GetAllTrainerFeed>(
          future: controller.getAllTainer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            children: <Widget>[
                              Column(
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
                                                      snapshot.data.data[index]
                                                          .userInfo.profile
                                                          .toString())),
                                        ),
                                      ),
                                    ),
                                    title: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAllTrainer(snapshot.data
                                                      .data[index].userId))),
                                      child: Text(
                                          snapshot.data.data[index].userInfo
                                              .username,
                                          style: const TextStyle(
                                              letterSpacing: 2,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    subtitle: snapshot
                                        .data.data[index].caption.text
                                        .make(),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.more_vert),
                                      color: Colors.white,
                                      onPressed: () => print("More"),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: NetworkPlayerWidget(Constants.urlImage +
                                    snapshot.data.data[index].video),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      HeartAnimationWidget(
                                          alwaysAnimate: true,
                                          isAnimating:
                                              index == index2 ? true : false,
                                          child: IconButton(
                                            icon: controller
                                                        .isLikedOrNot(index) ==
                                                    true
                                                ? const FaIcon(
                                                    FontAwesomeIcons.solidHeart,
                                                    color: Colors.red,
                                                  )
                                                : const FaIcon(
                                                    FontAwesomeIcons.heart,
                                                    color: Colors.white,
                                                  ),
                                            iconSize: 25.0,
                                            onPressed: controller
                                                        .isLikedOrNot(index) ==
                                                    true
                                                ? () {
                                                    setState(() {
                                                      controller
                                                          .likePost(index);
                                                    });
                                                  }
                                                : () {
                                                    setState(() {
                                                      index2 = index;
                                                      controller
                                                          .likePost(index);
                                                    });
                                                  },
                                          )),
                                      IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentPage(index))),
                                        icon: const FaIcon(
                                            FontAwesomeIcons.comment),
                                        iconSize: 25.0,
                                      ),
                                      IconButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentPage(index))),
                                        icon: const Icon(Icons.send),
                                        iconSize: 25.0,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () => print("save post"),
                                    icon: isSaved
                                        ? Icon(Icons.bookmark)
                                        : Icon(Icons.bookmark_border),
                                    iconSize: 25.0,
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        snapshot.data.data[index].likeInfo
                                            .length.text
                                            .fontWeight(FontWeight.w800)
                                            .make(),
                                        5.widthBox,
                                        "likes"
                                            .text
                                            .fontWeight(FontWeight.w800)
                                            .letterSpacing(1)
                                            .make()
                                      ],
                                    ),
                                    Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.only(top: 8),
                                        child: RichText(
                                            text: TextSpan(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "${snapshot.data.data[index].userInfo.username} ",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: jsonDecode(snapshot
                                                    .data.data[index].caption
                                                    .toString()),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                )),
                                          ],
                                        ))),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CommentPage(index))),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child:
                                            "View all  ${snapshot.data.data[index].commentInfo.length}  Comments"
                                                .text
                                                .textStyle(const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey))
                                                .make(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
