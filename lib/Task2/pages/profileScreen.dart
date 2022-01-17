
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/update_profile_model.dart';
import 'package:day1/Task2/model/view_my_profile_model.dart';
import 'package:day1/Task2/pages/edit_profile.dart';
import 'package:day1/Task2/pages/viewProfiles/tabBar.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  APIServices controller;
  int isSelected;

  Future<void> _refreshProducts(BuildContext context) async {
    Future<ViewProfileResponse> refresh;
    setState(() {
      refresh = controller.getUserProfile();
    });
    return refresh;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.updateUserProfileModel = UpdateUserProfileModel();
    Constants.isLoggedInPref();
    controller = APIServices();

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshProducts(context),
      child: FutureBuilder<ViewProfileResponse>(
        future: controller.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: snapshot.data.data.username.text.xl2
                    .letterSpacing(0.6)
                    .make(),
              ),
              body: Container(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
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
                            backgroundImage: NetworkImage(
                                "${Constants.urlImage}" +
                                    "${snapshot.data.data.profile}"),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  snapshot
                                      .data.data.myTrainerCount.text.xl.extraBold
                                      .make(),
                                  "My Trainer".text.make(),
                                ],
                              ),
                              30.widthBox,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TabBarFollowFollowing(
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
                                          builder: (context) =>
                                              TabBarFollowFollowing(
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
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: Colors.blue,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: "Edit Profile".text.xl.bold.make().centered(),
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
              ),
            );
          } else {
            return const CircularProgressIndicator().centered();
          }
        },
      ),
    );
  }
  Widget buildGridView(AsyncSnapshot<ViewProfileResponse> snapshot) {
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
