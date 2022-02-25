import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/comment_post_model.dart';
import 'package:day1/Task2/model/get_all_post_model.dart';
import 'package:day1/Task2/model/get_all_trainer_model.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_profile.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:day1/Task2/service/get_TrainerApi.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;

  var pageName;

  CommentPage(this.index, this.pageName, {Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  GetAllPostApi controller = GetAllPostApi();
  final _formKey = GlobalKey<FormState>();
  GetAllTrainerApi trainerController = GetAllTrainerApi();

  final TextEditingController commentController = TextEditingController();
  final TextEditingController trainerCommentController = TextEditingController();

  Future<void> _refreshProducts(BuildContext context) async {
    Future<GetAllPost> refresh;
    setState(() {
      refresh = controller.getAllPost();
    });
    return refresh;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Comments".text.xl.bold.make(),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: widget.pageName == "home"
            ? FutureBuilder<GetAllPost>(
                future: controller.getAllPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot
                                  .data.data[widget.index].commentInfo.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int i) {
                                if (i <
                                    snapshot.data.data[widget.index].commentInfo
                                        .length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListTile(
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
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          child: ClipOval(
                                            child: Image(
                                              height: 50.0,
                                              width: 50.0,
                                              image: NetworkImage(
                                                  Constants.urlImage +
                                                      snapshot
                                                          .data
                                                          .data[widget.index]
                                                          .commentInfo[i]
                                                          .userdetail
                                                          .profile),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewAllProfile(snapshot
                                                          .data
                                                          .data[widget.index]
                                                          .commentInfo[i]
                                                          .userId)));
                                        },
                                        child: snapshot
                                            .data
                                            .data[widget.index]
                                            .commentInfo[i]
                                            .userdetail
                                            .username
                                            .text
                                            .bold
                                            .make(),
                                      ),
                                      subtitle: Text(json.decode(snapshot
                                          .data
                                          .data[widget.index]
                                          .commentInfo[i]
                                          .caption
                                          .toString())),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.grey,
                                        iconSize: 14,
                                        onPressed: () => print("Liked comment"),
                                      ),
                                    ),
                                  );
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          TextFormField(
                            controller: commentController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText:
                                    "Comment on ${snapshot.data.data[widget.index].userInfo.username}'s post",
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      controller
                                          .commentPosts(
                                              snapshot
                                                  .data.data[widget.index].id,
                                              commentController.text)
                                          .then((CommentPostModel response) {
                                        if (response != null) {
                                          setState(() {
                                            commentController.text = "";
                                          });
                                        }
                                      });
                                    }),
                                border: const OutlineInputBorder()),
                          ).p12(),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            : FutureBuilder<GetAllTrainerFeed>(
                future: trainerController.getAllTainer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot
                                  .data.data[widget.index].commentInfo.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int i) {
                                if (i <
                                    snapshot.data.data[widget.index].commentInfo
                                        .length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListTile(
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
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          child: ClipOval(
                                            child: Image(
                                              height: 50.0,
                                              width: 50.0,
                                              image: NetworkImage(
                                                  Constants.urlImage +
                                                      snapshot
                                                          .data
                                                          .data[widget.index]
                                                          .commentInfo[i]
                                                          .userdetail
                                                          .profile),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: GestureDetector(
                                        onTap: () {},
                                        child: snapshot
                                            .data
                                            .data[widget.index]
                                            .commentInfo[i]
                                            .userdetail
                                            .username
                                            .text
                                            .bold
                                            .make(),
                                      ),
                                      subtitle: Text(json.decode(snapshot
                                          .data
                                          .data[widget.index]
                                          .commentInfo[i]
                                          .caption
                                          .toString())),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.grey,
                                        iconSize: 14,
                                        onPressed: () => print("Liked comment"),
                                      ),
                                    ),
                                  );
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          TextFormField(
                            controller: trainerCommentController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText:
                                    "Comment on ${snapshot.data.data[widget.index].userInfo.username}'s post",
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      controller
                                          .commentPosts(
                                              snapshot
                                                  .data.data[widget.index].id,
                                              trainerCommentController.text)
                                          .then((CommentPostModel response) {
                                        if (response != null) {
                                          setState(() {
                                            Constants.isApiCallProcess = false;
                                          });
                                        }
                                      });
                                    }),
                                border: const OutlineInputBorder()),
                          ).p12(),
                        ],
                      ),
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
