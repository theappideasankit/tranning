import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_all_post.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentPage extends StatefulWidget {
  var index;

  CommentPage(this.index);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Future<void> _refreshProducts(BuildContext context) async {
    Future<GetAllPost> refresh;
    setState(() {
      refresh = GetAllPostApi.getAllPost();
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
          future: GetAllPostApi.getAllPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.data[widget.index].commentInfo.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
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
                                  snapshot.data.data[widget.index]
                                      .commentInfo[i].userdetail.profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: snapshot.data.data[widget.index].commentInfo[i]
                          .userdetail.username.text.bold
                          .make(),
                      subtitle: Text(json.decode(snapshot
                          .data.data[widget.index].commentInfo[i].caption.toString())),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.grey,
                        iconSize: 14,
                        onPressed: () => print("Liked comment"),
                      ),
                    ),
                  );
                },
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
