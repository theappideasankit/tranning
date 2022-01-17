import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/comment_post_model.dart';
import 'package:day1/Task2/model/get_all_post_model.dart';
import 'package:day1/Task2/model/get_all_trainer_model.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_profile.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:day1/Task2/service/get_TrainerApi.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;

  const CommentPage(this.index, {Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  GetAllPostApi controller = GetAllPostApi();
  final _formKey = GlobalKey<FormState>();

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
        child: FutureBuilder<GetAllPost>(
          future: controller.getAllPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            snapshot.data.data[widget.index].commentInfo.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          if (i <
                              snapshot
                                  .data.data[widget.index].commentInfo.length) {
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
                                        image: NetworkImage(Constants.urlImage +
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
                                subtitle: Text(json.decode(snapshot.data
                                    .data[widget.index].commentInfo[i].caption
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
                      keyboardType: TextInputType.multiline,
                      onSaved: (input) => Constants.commentPost.caption = input,
                      decoration: InputDecoration(
                          hintText:
                              "Comment on ${snapshot.data.data[widget.index].userInfo.username}'s post",
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                if (postCommentProfile()) {
                                  setState(() {
                                    Constants.isApiCallProcess = true;
                                  });
                                  controller
                                      .commentPosts(widget.index)
                                      .then((CommentPostModel response) {
                                    if (response != null) {
                                      setState(() {
                                        Constants.isApiCallProcess = false;
                                      });
                                      if (response.code == 200) {
                                        FormHelper.showSimpleAlertDialog(
                                          context,
                                          "Comment success",
                                          response.message,
                                          "Ok",
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      } else {
                                        FormHelper.showSimpleAlertDialog(
                                          context,
                                          " comment Fail",
                                          response.message,
                                          "Ok",
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }
                                    }
                                  });
                                }
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

  bool postCommentProfile() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class TrainerCommentPage extends StatefulWidget {
  var index;

  TrainerCommentPage(this.index);

  @override
  _TrainerCommentState createState() => _TrainerCommentState();
}

class _TrainerCommentState extends State<TrainerCommentPage> {
  final _formKey = GlobalKey<FormState>();
  CommentPost commentPost = CommentPost();
  GetAllTrainerApi controller;

  final TextEditingController commentController = TextEditingController();

  Future<void> _refreshProducts(BuildContext context) async {
    Future<GetAllTrainerFeed> refresh;
    setState(() {
      refresh = controller.getAllTainer();
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
        child: FutureBuilder<GetAllTrainerFeed>(
          future: controller.getAllTainer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            snapshot.data.data[widget.index].commentInfo.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          if (i <
                              snapshot
                                  .data.data[widget.index].commentInfo.length) {
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
                                        image: NetworkImage(Constants.urlImage +
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
                                subtitle: Text(json.decode(snapshot.data
                                    .data[widget.index].commentInfo[i].caption
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
                      onSaved: (input) => commentPost.caption = input,
                      decoration: InputDecoration(
                          hintText: "Comment as ankitsayz",
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                if (videoCommentProfile()) {
                                  setState(() {
                                    Constants.isApiCallProcess = true;
                                  });
                                  GetAllPostApi()
                                      .commentPosts(widget.index)
                                      .then(
                                          (value) => commentController.clear());
                                }
                              }),
                          border: OutlineInputBorder()),
                    ),
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

  bool videoCommentProfile() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
