import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_all_post_model.dart';
import 'package:day1/Task2/model/view_all_profile_model.dart';
import 'package:day1/Task2/pages/viewProfiles/tabBar.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ViewAllProfile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var id;

  ViewAllProfile(this.id, {Key key}) : super(key: key);

  @override
  _ViewAllProfileState createState() => _ViewAllProfileState();
}

class _ViewAllProfileState extends State<ViewAllProfile> {
  GetAllPostApi controller;
  int isSelected;

  Future<void> _refreshProducts(BuildContext context) async {
    Future<ViewAllProfileModel> refresh;
    setState(() {
      refresh = controller.getAllProfile(widget.id);
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
    return RefreshIndicator(
      onRefresh: () => _refreshProducts(context),
      child: FutureBuilder<ViewAllProfileModel>(
          future: controller.getAllProfile(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: snapshot.data.data.username.text.xl2
                      .letterSpacing(0.6)
                      .make(),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(Constants.urlImage +
                                snapshot.data.data.profile),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  snapshot.data.data.postList.length.text.xl
                                      .extraBold
                                      .make(),
                                  "Posts".text.make(),
                                ],
                              ),
                              30.widthBox,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TabBarFollowFollowing(
                                              snapshot.data.data.id,
                                              isSelected = 0)));
                                },
                                child: Column(
                                  children: [
                                    snapshot.data.data.followersCount.text.xl
                                        .extraBold
                                        .make(),
                                    "Followers".text.make(),
                                  ],
                                ),
                              ),
                              30.widthBox,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TabBarFollowFollowing(
                                              snapshot.data.data.id,
                                              isSelected = 1)));
                                },
                                child: Column(
                                  children: [
                                    snapshot.data.data.followingCount.text.xl
                                        .extraBold
                                        .make(),
                                    "Following".text.make(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      snapshot.data.data.username.text.bold.xl
                          .letterSpacing(0.6)
                          .make()
                          .py4(),
                      snapshot.data.data.bio.text.letterSpacing(0.4).make(),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      Material(
                        color: snapshot.data.data.isFollowCount.isEven
                            ? Colors.black
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        borderOnForeground: true,
                        child: InkWell(
                          splashColor: Colors.blueAccent,
                          // ignore: avoid_print
                          onTap: () {
                            controller.followUser(widget.id).then((value) {
                              controller.getAllProfile(widget.id).then((value) {
                                setState(() {});
                              });
                            });
                          },
                          child: AnimatedContainer(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            duration: const Duration(seconds: 5),
                            child: snapshot.data.data.isFollowCount.isEven
                                ? "Follow".text.xl.bold.make().centered()
                                : "Following".text.xl.bold.make().centered(),
                          ).p4(),
                        ),
                      ),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      "My Posts".text.xl.make(),
                      10.heightBox,
                      const Divider(),
                      Expanded(
                        child: buildGridView(snapshot),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator().centered();
            }
          }),
    );
  }

  Widget buildGridView(AsyncSnapshot<ViewAllProfileModel> snapshot) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.data.postList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, gridIndex) {
          return snapshot.data.data.postList[gridIndex].image.toString() ==
                  "null"
              ? Container(
                  width: 125.0,
                  height: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(Constants.urlImage +
                          snapshot.data.data.postList[gridIndex].coverPhotos),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container(
                  width: 125.0,
                  height: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(Constants.urlImage +
                          snapshot.data.data.postList[gridIndex].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
        });
  }
}
