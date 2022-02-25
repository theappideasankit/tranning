import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/customWidgets/HeartAnimationWidget.dart';
import 'package:day1/Task2/model/get_all_post_model.dart';
import 'package:day1/Task2/pages/BottomNavPages/comment_page.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_profile.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_trainer.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeTimeLine extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  const HomeTimeLine({Key key}) : super(key: key);

  @override
  _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
  bool isSaved = false;
  bool isDoubleTapped = false;
  int index2;

  GetAllPostApi controller;

  Future<void> _refreshProducts(BuildContext context) async {
    Future<GetAllPost> refresh;
    setState(() {
      refresh = controller.getAllPost();
    });
    return refresh;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = GetAllPostApi();
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
                // ignore: avoid_print
                onPressed: () => print('notification'),
              ),
              IconButton(
                  // ignore: avoid_print
                  onPressed: () => print("add post"),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
      backgroundColor: Colors.black45,
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: buildGetAllPost(),
      ),
    );
  }

  Widget buildGetAllPost() {
    return FutureBuilder<GetAllPost>(
      future: controller.getAllPost(),
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
                                leading: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
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
                                  onTap: () {
                                    if (snapshot.data.data[index].userInfo
                                            .rolleId ==
                                        1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAllProfile(snapshot.data
                                                      .data[index].userId)));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAllTrainer(snapshot.data
                                                      .data[index].userId)));
                                    }
                                  },
                                  child: Text(
                                      snapshot
                                          .data.data[index].userInfo.username,
                                      style: const TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                subtitle: Text(
                                  DateFormat.yMMMd().format(
                                      snapshot.data.data[index].createdAt),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  color: Colors.white,
                                  // ignore: avoid_print
                                  onPressed: () => print("More"),
                                ),
                              ),
                            ],
                          ),
                          snapshot.data.data[index].image.toString() == "null"
                              ? Container()
                              : GestureDetector(
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(Constants.urlImage +
                                            snapshot.data.data[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      opacity: index == index2 ? 1 : 0,
                                      child: HeartAnimationWidget(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          onEnd: () =>
                                              setState(() => index2 = null),
                                          isAnimating:
                                              index == index2 ? true : false,
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 100,
                                          )),
                                    ),
                                  ),
                                  onDoubleTap:
                                      controller.isLikedOrNot(index) == true
                                          ? () {
                                              setState(() {
                                                controller.likePost(index);
                                              });
                                            }
                                          : () {
                                              setState(() {
                                                index2 = index;
                                                controller.likePost(index);
                                              });
                                            },
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  HeartAnimationWidget(
                                      alwaysAnimate: true,
                                      isAnimating:
                                          index == index2 ? true : false,
                                      child: IconButton(
                                        icon: controller.isLikedOrNot(index) ==
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
                                                  controller.likePost(index);
                                                });
                                              }
                                            : () {
                                                setState(() {
                                                  index2 = index;
                                                  controller.likePost(index);
                                                });
                                              },
                                      )),
                                  IconButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentPage(index, "home"))),
                                    icon:
                                        const FaIcon(FontAwesomeIcons.comment),
                                    iconSize: 25.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    iconSize: 25.0,
                                  ),
                                ],
                              ),
                              HeartAnimationWidget(
                                alwaysAnimate: true,
                                isAnimating:
                                    snapshot.data.data[index].isSaveCount == 1
                                        ? true
                                        : false,
                                child: IconButton(
                                  // ignore: avoid_print
                                  onPressed: () => controller
                                      .savePost(snapshot.data.data[index].id)
                                      .then((value) {
                                    controller.getAllPost().then((value) {
                                      setState(() {});
                                    });
                                  }),
                                  icon:
                                      snapshot.data.data[index].isSaveCount == 1
                                          ? const Icon(Icons.bookmark)
                                          : const Icon(Icons.bookmark_border),
                                  iconSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    snapshot
                                        .data.data[index].likeInfo.length.text
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                                "${snapshot.data.data[index].userInfo.username} ",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
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
                                              CommentPage(index, "home"))),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child:
                                        "View all  ${snapshot.data.data[index].commentInfo.length}  Comments"
                                            .text
                                            .textStyle(const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey))
                                            .make(),
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(
                                      snapshot.data.data[index].createdAt),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
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
    );
  }
}
