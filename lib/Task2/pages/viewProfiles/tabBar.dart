import 'package:day1/Task2/model/view_all_profile_model.dart';
import 'package:day1/Task2/pages/viewProfiles/view_followers.dart';
import 'package:day1/Task2/pages/viewProfiles/view_following.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:flutter/material.dart';

class TabBarFollowFollowing extends StatefulWidget {
  int id;
  int isSelected;
  TabBarFollowFollowing(this.id, this.isSelected);


  @override
  _TabBarFollowFollowingState createState() => _TabBarFollowFollowingState();
}

class _TabBarFollowFollowingState extends State<TabBarFollowFollowing> {
  int isSelected;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.isSelected,
        length: 2,
        child: FutureBuilder<ViewAllProfileModel>(
          future: GetAllPostApi().getAllProfile(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title:  Text(snapshot.data.data.username),
                  bottom:  TabBar(
                      indicatorColor: Colors.black,
                      indicatorWeight: 2.0,
                      labelColor: Colors.white,
                      labelPadding: const EdgeInsets.only(top: 10.0),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: ' ${snapshot.data.data.followersCount} \t followers',
                        ),
                        Tab(
                          text: ' ${snapshot.data.data.followingCount} \t following',
                        )
                      ]),
                ),
                body: TabBarView(children: [
                  ViewFollowers(widget.id,),
                  ViewFollowing(widget.id),
                ]),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}

