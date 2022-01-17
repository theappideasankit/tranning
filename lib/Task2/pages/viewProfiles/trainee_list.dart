import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_following_model.dart';
import 'package:day1/Task2/model/get_trainee_list_model.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_profile.dart';
import 'package:day1/Task2/pages/viewProfiles/viewAll_trainer.dart';
import 'package:day1/Task2/service/get_follow_following.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class TraineeList extends StatefulWidget {
  var id;

  TraineeList(this.id);

  @override
  _TraineeListState createState() => _TraineeListState();
}

class _TraineeListState extends State<TraineeList> {
  GetFollowFollowing controller = GetFollowFollowing();
  TextEditingController TraineeSearchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TraineeSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<GetTraineeListModel>(
      future: controller.getTraineeApi(widget.id, TraineeSearchController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: "Trainee list".text.make(),
            ),
            body: Column(
              children: [
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF262626),
                  ),
                  child: TextFormField(
                    controller: TraineeSearchController,
                    onChanged: (value) {
                      controller.getFollowingApi(widget.id, value).then((value) {
                        setState(() {});
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0),
                        child: FaIcon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white.withOpacity(0.3)),
                    cursorColor: Colors.white.withOpacity(0.3),
                  ),
                ).p12(),
                Expanded(
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data.data.subscriber.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                    height: 50.0,
                                    width: 50.0,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Constants.urlImage +
                                        snapshot
                                            .data.data.subscriber[index].profile
                                            .toString())),
                              ),
                            ),
                          ),
                          title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewAllProfile(
                                          snapshot.data.data.subscriber[index]
                                              .pivot.userId)));
                            },
                            child: Text(
                                snapshot.data.data.subscriber[index].username,
                                style: const TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
