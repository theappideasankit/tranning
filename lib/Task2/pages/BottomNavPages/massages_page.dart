import 'package:day1/Task2/model/get_saved_post.dart';
import 'package:day1/Task2/model/searchusers_map_model.dart';
import 'package:day1/Task2/service/get_FeedApi.dart';
import 'package:day1/Task2/service/search_api.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';

class MassagePage extends StatefulWidget {
  const MassagePage({Key key}) : super(key: key);

  @override
  _MassagePageState createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  GetAllPostApi controller = GetAllPostApi();
  //int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = GetAllPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetSavedPost>(
          future: controller.getSavedPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int index;
              if (snapshot.data.data.length != null) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.data[index].postInfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (context, gridIndex) {
                      return Container(
                        width: 125.0,
                        height: 125.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(Constants.urlImage +
                                snapshot.data.data[index].postInfo[gridIndex]
                                    .image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    });
              } else {
                return Container();
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
