import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/customWidgets/HeartAnimationWidget.dart';
import 'package:day1/Task2/model/get_single_post_model.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_profile.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_trainer.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'BottomNavPages/comment_page.dart';

// ignore: must_be_immutable
class ViewSinglePost extends StatefulWidget {
  int id;

  // ignore: prefer_typing_uninitialized_variables

  ViewSinglePost(this.id, {Key key}) : super(key: key);

  @override
  _ViewSinglePostState createState() => _ViewSinglePostState();
}

class _ViewSinglePostState extends State<ViewSinglePost> {
  int index2;

  APIServices controller = APIServices();
  GetAllPostApi controllers = GetAllPostApi();

  Future<void> _refreshProducts(BuildContext context) async {
    Future<GetSinglePost> refresh;
    setState(() {
      refresh = controller.getSinglePosts(widget.id);
    });
    return refresh;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            "Post".text.xl3.make(),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black45,
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: FutureBuilder<GetSinglePost>(
          future: controller.getSinglePosts(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                                        image: NetworkImage(Constants.urlImage +
                                            snapshot.data.data.userInfo.profile
                                                .toString())),
                                  ),
                                ),
                              ),
                              title: GestureDetector(
                                onTap: () {
                                  if (snapshot.data.data.userInfo.rolleId ==
                                      1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewAllProfile(snapshot
                                                    .data.data.userId)));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewAllTrainer(snapshot
                                                    .data.data.userId)));
                                  }
                                },
                                child: Text(
                                    snapshot.data.data.userInfo.username,
                                    style: const TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              subtitle: Text(
                                DateFormat.yMMMd()
                                    .format(snapshot.data.data.createdAt),
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
                        snapshot.data.data.image.toString() == "null"
                            ? Container()
                            : GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(Constants.urlImage +
                                          snapshot.data.data.image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    opacity: widget.id == index2 ? 1 : 0,
                                    child: HeartAnimationWidget(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        onEnd: () =>
                                            setState(() => index2 = null),
                                        isAnimating:
                                            widget.id == index2 ? true : false,
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 100,
                                        )),
                                  ),
                                ),
                                onDoubleTap:
                                    controllers.isLikedOrNot(widget.id) == true
                                        ? () {
                                            setState(() {
                                              controllers.likePost(widget.id);
                                            });
                                          }
                                        : () {
                                            setState(() {
                                              index2 = widget.id;
                                              controllers.likePost(widget.id);
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
                                        widget.id == index2 ? true : false,
                                    child: IconButton(
                                      icon:
                                          controllers.isLikedOrNot(widget.id) ==
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
                                      onPressed: controllers
                                                  .isLikedOrNot(widget.id) ==
                                              true
                                          ? () {
                                              setState(() {
                                                controllers.likePost(widget.id);
                                              });
                                            }
                                          : () {
                                              setState(() {
                                                index2 = widget.id;
                                                controllers.likePost(widget.id);
                                              });
                                            },
                                    )),
                                IconButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CommentPage(widget.id, "home"))),
                                  icon: const FaIcon(FontAwesomeIcons.comment),
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
                              isAnimating: widget.id == index2 ? true : false,
                              child: IconButton(
                                // ignore: avoid_print
                                onPressed: () => controllers
                                    .savePost(snapshot.data.data.id)
                                    .then((value) {
                                  controller
                                      .getSinglePosts(widget.id)
                                      .then((value) {
                                    setState(() {});
                                  });
                                }),
                                icon: snapshot.data.data.isSaveCount == 1
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
                                  snapshot.data.data.likeInfo.length.text
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
                                    style: const TextStyle(color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text:
                                              "${snapshot.data.data.userInfo.username} ",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: jsonDecode(snapshot
                                              .data.data.caption
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
                                            CommentPage(widget.id, "home"))),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child:
                                      "View all  ${snapshot.data.data.commentInfo.length}  Comments"
                                          .text
                                          .textStyle(const TextStyle(
                                              fontSize: 14, color: Colors.grey))
                                          .make(),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd()
                                    .format(snapshot.data.data.createdAt),
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
