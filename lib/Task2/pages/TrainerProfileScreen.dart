/*

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/view_all_trainer_profile_model.dart';
import 'package:day1/Task2/model/update_profile_model.dart';
import 'package:day1/Task2/model/view_my_profile_model.dart';
import 'package:day1/Task2/pages/edit_profile.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:day1/Task2/service/get_TrainerApi.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool circular = true;
  GetAllTrainerApi controller = GetAllTrainerApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.updateUserProfileModel = UpdateUserProfileModel();
    Constants.isLoggedInPref();
  }

  @override
  Widget build(BuildContext context) {
    return getAllProfiles();
  }

  Widget getAllProfiles() {
    return FutureBuilder<GetTrainerProfile>(
      future: controller.getTrainerProfile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
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
                          backgroundImage: NetworkImage(Constants.urlImage +
                              snapshot.data.data.profile),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                snapshot
                                    .data.data.postList.length.text.xl.extraBold
                                    .make(),
                                "Posts".text.make(),
                              ],
                            ),
                            30.widthBox,
                            Column(
                              children: [
                                snapshot
                                    .data.data.followersCount.text.xl.extraBold
                                    .make(),
                                "Followers".text.make(),
                              ],
                            ),
                            30.widthBox,
                            Column(
                              children: [
                                snapshot
                                    .data.data.traineeCount.text.xl.extraBold
                                    .make(),
                                "Trainee".text.make(),
                              ],
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
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {

                        },
                        child: AnimatedContainer(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          duration: const Duration(seconds: 5),
                          child: "follow".text.xl.bold.make().centered(),
                        ).p4(),
                      ),
                    ),
                    10.heightBox,
                    const Divider(),
                    10.heightBox,
                    "Posts".text.xl.make(),
                    10.heightBox,
                    const Divider(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator().centered();
        }
      },
    );
  }
}
*/
